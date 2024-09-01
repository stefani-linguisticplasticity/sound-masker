<CsoundSynthesizer>
<CsOptions>
-odac
</CsOptions>
<CsInstruments>

sr = 44100
ksmps   = 32
nchnls  = 2
0dbfs   = 1

instr 1

;panning through volume control
kleft                   init p4
kright                  init p5

;something like "banded noise between four and thirty hertz"
abnnz                   jspline 1, 8, 60     

;convert the banded noise to a multiplier for pitch variation of frequency
afmult                  = exp(abnnz / log(2))

;ring modulator on Pythagorean dodecaphonic tritonal
;with rapid frequency variation about 2000 herz
abase                   oscil 1, afmult*2000
aring                   oscil 1, afmult*2000*729/512
aout                    = abase*aring


;final output
                        outs kleft*aout, kright*aout

endin
</CsInstruments>
<CsScore>
y
i 1.1 0 -1 1 0
i 1.2 0 -1 0 1
e 36000
</CsScore>
</CsoundSynthesizer>
