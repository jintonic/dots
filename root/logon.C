{
   // list existing style:
   // gROOT->GetListOfStyles()->Print()

   // pick up one:
   gROOT->SetStyle("Plain");

   // modify it:
   gStyle->SetMarkerStyle(kFullDotSmall);
   gStyle->SetLegendBorderSize(0);
   gStyle->SetLegendFont(22);
   gStyle->SetTitleBorderSize(0);
   gStyle->SetOptStat(1111110); // show more information
   gStyle->SetOptFit(); // show fit result
   gStyle->SetFitFormat(".2f"); // shorten fit result
   gStyle->SetStatX(0.99); // top right corner x
   gStyle->SetStatY(0.99); // top right corner y
   gStyle->SetStatFont(22);
   gStyle->SetLabelFont(22,"XYZ");
   gStyle->SetTitleFont(22,"H");
   gStyle->SetTitleFont(22,"XYZ");
   gStyle->SetLabelSize(0.05,"XYZ");
   gStyle->SetTitleSize(0.05,"XYZ");
   gStyle->SetTitleOffset(1.1,"Y");
   //gStyle->SetTitleOffset(-0.5,"Z");
   //gStyle->SetPadRightMargin(0.02);
   gStyle->SetPadLeftMargin(0.12);
   //gStyle->SetPadTopMargin(0.02);
   gStyle->SetPadBottomMargin(0.11);
   // http://root.cern.ch/root/html/TAttText.html#T1
   gStyle->SetTitleAlign(23);
   gStyle->SetTitleX(0.5);

   gStyle->SetPalette(kRainBow);

   // apply this style to histograms created with other styles
   gROOT->ForceStyle();
}
