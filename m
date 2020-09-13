Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3E026812F
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 13 Sep 2020 22:40:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kHYn3-0003aB-In; Sun, 13 Sep 2020 20:40:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <support@gulsumkaymaz.com.tr>) id 1kHYn2-0003a4-2B
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 13 Sep 2020 20:40:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-ID:Reply-To:From:Date:Subject:To:Sender:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OxCVyWLXeHjXrD6pbTXx74+GEy5l9sivXf5lG5bkHfI=; b=OCr3dVrNpKhQ3hA3J9B3MMbYC7
 dB0beAedfO5GaKJWZYeI9obXBTocfAAR8gLkHFCIWXSh0FUBQiMILdJmKJFJ5LMgsHijB9nSxjKLY
 ZvSGPifeczpinCi4ipxaCo3a545Enlz36LD/VqQ05rKxuGbGKN0jeCzIeJdEnDuywtLA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Reply-To:
 From:Date:Subject:To:Sender:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=OxCVyWLXeHjXrD6pbTXx74+GEy5l9sivXf5lG5bkHfI=; b=h
 wp5XDVYKZQVlde5GN6Rvc6nXmUTOK7Z8SnzMY8XPriwNJB1zY78NPBK27YgZAEOmt8hE7Tm85Jjrb
 e7M3309advv95PuxRKIfDEvZZdZmvB97Hv1IknbY2eQT/gh1ril7cggUZWuH79YI/I4b0oKGhgAXE
 5TAzVRCs6WQe7KN8=;
Received: from 195-154-167-57.rev.poneytelecom.eu ([195.154.167.57]
 helo=iskasoft.local) by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kHYmz-0089vZ-Sl
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 13 Sep 2020 20:40:00 +0000
Received: from iskasoft.local (localhost.localdomain [127.0.0.1])
 by iskasoft.local (Postfix) with ESMTP id C64A5CEC1307
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 13 Sep 2020 23:01:42 +0300 (+03)
Authentication-Results: iskasoft.local;
 spf=pass (sender IP is 127.0.0.1) smtp.mailfrom=support@gulsumkaymaz.com.tr
 smtp.helo=iskasoft.local
Received-SPF: pass (iskasoft.local: localhost is always allowed.)
 client-ip=127.0.0.1; envelope-from=support@gulsumkaymaz.com.tr;
 helo=iskasoft.local; 
X-Spam-Flag: NO
X-Spam-Score: 6.415
X-Spam-Level: ******
X-Spam-Status: No, score=6.415 tagged_above=-9999 required=7
 tests=[BAYES_50=0.8, FREEMAIL_FORGED_REPLYTO=2.095, HK_LOTTO=1,
 LOTS_OF_MONEY=0.001, MONEY_FORM_SHORT=2.499, NO_RELAYS=-0.001,
 T_FILL_THIS_FORM_FRAUD_PHISH=0.01, T_FILL_THIS_FORM_SHORT=0.01,
 URIBL_BLOCKED=0.001] autolearn=no autolearn_force=no
Received: from iskasoft.local ([127.0.0.1])
 by iskasoft.local (iskasoft.local [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mmuM67g1uU2e
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 13 Sep 2020 23:01:42 +0300 (+03)
Received: by iskasoft.local (Postfix, from userid 10005)
 id 11181CEC1A7B; Sun, 13 Sep 2020 22:43:42 +0300 (+03)
To: linux-f2fs-devel@lists.sourceforge.net
Date: Sun, 13 Sep 2020 19:43:42 +0000
From: El Gordo de la Primitiva Lotterien Spanien <support@gulsumkaymaz.com.tr>
Message-ID: <83e5e21620b5f501fc6ce0e89e794133@gulsumkaymaz.com.tr>
MIME-Version: 1.0
X-Spam-Score: 3.0 (+++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: spainmail.com]
 0.0 TVD_RCVD_IP            Message was received from an IP address
 -1.5 SPF_CHECK_PASS         SPF reports sender host as permitted sender for
 sender-domain
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 1.0 HK_LOTTO               No description available.
 1.0 RDNS_DYNAMIC           Delivered to internal network by host with
 dynamic-looking rDNS
 0.0 LOTS_OF_MONEY          Huge... sums of money
 2.5 FREEMAIL_FORGED_REPLYTO Freemail in Reply-To, but not From
 0.0 T_FILL_THIS_FORM_SHORT Fill in a short form with personal information
 0.0 MONEY_FORM_SHORT       Lots of money if you fill out a short form
 0.0 T_FILL_THIS_FORM_FRAUD_PHISH Answer suspicious question(s)
X-Headers-End: 1kHYmz-0089vZ-Sl
Subject: [f2fs-dev] Auszeichnungen gewinnen
X-BeenThere: linux-f2fs-devel@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-f2fs-devel.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=linux-f2fs-devel>
List-Post: <mailto:linux-f2fs-devel@lists.sourceforge.net>
List-Help: <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=subscribe>
Reply-To: santalucia.sg.es@spainmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

RWwgR29yZG8gZGUgbGEgUHJpbWl0aXZhIExvdHRlcmllbiBTcGFuaWVuIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgCkFkcmVzc2U6IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgCkNhbGxlIGRlbCBQcsOtbmNp
cGUgZGUgVmVyZ2FyYSwgMzgsIDI4MDAxIE1hZHJpZCBFc3Bhw7FhIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIApFIG1haWw6
XWFuc3BydWNoZ2V3aW5uLm1tdC5lc0BzcGFpbm1haWwuY29tXQpLb250YWt0IGF1Zm5laG1lbiB1
bnRlcjpdICAzNDYwMiA4MTAgMTg1IGZheCAgMzQ5MzU0NTc0OTBdCkFrdGVuemVpY2hlbjpdUDA5
LzAxLzAyLzIwMjAuXQpMb3NudW1tZXI6XSBFU1AgNDQ0Ny8xMTQ2NDExODgwMjAxXQrCoERhdHVt
OiAxMC8wOS8yMDIwCsKgCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgCkhhbGxvLCDCoCDCoCDCoCDCoCAK
ICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgIE9GRklaSUVMTEUg
TUlUVEVJTFVORywKwqAKRGllc2UgRWwgR29yZG8gZGUgbGEgUHJpbWl0aXZhIFNvbW1lciBCb25h
bnphIMKgTG90dGVyaWUgd3VyZGUgwqAgdW5kIE1pbmlzdGVyaW8gZGUgSW5kdXN0cmlhLCBDb21l
cmNpbyB5IFR1cmlzbW8gwqBnZXNwb25zZXJ0IHVtIFRvdXJpc211cyBpbiBFc3Bhw7FhIMKgenUg
ZsO2cmRlcm4uCsKgCldpciBzaW5kIGVyZnJldXQgSWhuZW4gbWl0IHp1IHRlaWxlbiwgZGFzcyBk
aWUgR2V3aW5uZXIgZGVzIFNvbmRlciBTcGFuaXNoIFRvdXJpc211cyBQcm9tb3Rpb25hbCBEcmF3
IGJla2FubnQgZ2VnZWJlbiB3b3JkZW4gc2luZC4gRGllIG9mZml6aWVsbGUgTGlzdGUgZGVyIEdl
d2lubmVyIMKgZXJzY2hpZW4gYW0gwqBTYW1zdGFnIGRlciAyMi8wOC8yMDIwLiAKwqAKSWhyZSBl
bWFpbCBhZHJlc3NlIMKgbWl0IGRlciBhbmjDpG5nZW5kZW4gTG9zbnVtbWVyOiBFU1AgNDQ0Ny8x
MTQ2NDExODgwMjAxIMKgdW5kIG1pdCBkZXIgU2VyaWVubnVtbWVyOiBFU1AvMDE4ODExLTIwMjAg
em9nIGRpZSBHbMO8Y2tzbnVtbWVyOiA2LjE2LjE4LjMzLjQ3LjUxIEJvbnU6MjksRWwgR29yZG8g
ZGUgbGEgUHJpbWl0aXZhIMKgTG90dGVyaWUgwqA2IC80OSBpbiBkZXIgMy4gS2F0ZWdvcmllLgrC
oApTaWUgc2luZCBkYW1pdCBnZXdpbm5lciB2b246IOKCrDk5MSwwMDAuMDAgRXVyby4gRGllIFN1
bW1lIGVyZ2lidCBzaWNoIGF1cyBlaW5lciBHZXdpbm5hdXNzY2jDvHR0dW5nIHZvbjog4oKsNjkz
NywwMDAuMDAgRXVybywgZGllIGR1cmNoIGRpZSBlcnN0ZW4gc2llYmVuICg3KSBHZXdpbm5lciBh
dXMgZGVyIGdsZWljaGVuIEthdGVnb3JpZSBnZXRlaWx0IHd1cmRlLiDCoERpciBnZXdpbm4gaXN0
IGJlaSBlaW5lciBzaWNoZXJoZWl0c2Zpcm1hIGhpbnRlcmxlZ3QgdW5kIGluIGlocmVuIG5hbWVu
L2VtYWlsIMKgdmVyc2ljaGVydC4gdW0ga2VpbmUga29tcGxpa2F0aW9uZW4gYmVpIGRlciBhYndp
Y2tsdW5nIGRlciB6YWhsdW5nIHp1IHZlcnVyc2FjaGVuIGJpdHRlbiB3aXIgc2llIGRpZXNlIG9m
Zml6aWVsbGUgbWl0dGVpbHVuZyAsIGRpc2tyZXQgenUgYmVoYW5kZWxuLixlcyBpc3QgZWluIHRl
aWwgdW5zZXJlcyBzaWNoZXJoZWl0c3Byb3Rva29sbHMgdW5kIGdhcmFudGllcnQgaWhuZW4gZWlu
ZW4gcmVpYnVuZ3Nsb3NlbiBBYmxhdWYuCsKgCkFsbGUgZ2V3aW5uZXIgd3VyZGVuIHBlciBjb21w
dXRlciBhdXMgVXJsYXVic2hvdGVscywgRmx1Z2dlc2VsbHNjaGFmdGVuIHVuZCBSZWlzZWLDvHJv
cyBtYWlsZW4gRGF0ZW4gdm9uIGbDvG5mIE1pbGxpb25lbiAoNTAwMDAwMCkgRW1haWwgYWRyZXNz
ZW4gYXVzZ2V3w6RobHQsIGFscyB0ZWlsIHVuc2VyZXIgSW50ZXJuYXRpb25hbGVuIHRvdXJpc211
cyBwcm9tb3Rpb24gcHJvZ3JhbW1zLCB3ZWxjaGVzIHdpciBlaW5tYWwgaW0gamFociB2ZXJhbnN0
YWx0ZW4gdW0gVG91cmlzbXVzIGluIFNwYW5pZW4genUgZsO2cmRlcm4uCsKgCkJpdHRlIGtvbnRh
a3RpZXJlbiBzaWUgdW5zZXJlbiBhdXNsYW5kcyBzYWNoYmVhcmJlaXRlciBIZXJyIEdhYnJpZWwg
wqBiZWkgZGVyIHNpY2hlcmhlaXRzZmlybWEgU2FudGFsdWNpYSBTaWNoZXJoZWl0c2Zpcm1hOlBl
ciBFbWFpbCBhbjpiZXJhdGVyZ2FicmllbC5zcEBjb25zdWx0YW50LmNvbSBvZGVyIGFucnVmZW46
IDM0IDYwMiA4MTAgMTg1ICYgRmF4OiAgMzQgOTMxIDcwIDIxMjAsIHVtIElociBHZWxkIHNjaG5l
bGwgenUgYmVrb21tZW4uCsKgCkRlbmtlbiBTaWUgZGFyYW4sIGplZGVyIGdld2lubmFuc3BydWNo
IG11c3MgYmlzIHp1bSAzMC85LzIwMjAgQW5nZW1lbGRldGUgc2Vpbi4gSmVkZXIgbmljaHQgYW5n
ZW1lbGRldCBHZXdpbm5hbnNwcnVjaCB2ZXJmw6RsbHQgdW5kIGdlaHQgenVydWNrIGFuIGRhcyBT
cGFuaXNjaGUgU3RhYXRza2Fzc2UuCsKgIApXSUNIVElHOiB1bSB2ZXJ6w7ZnZXJ1bmdlbiB1bmQg
a29tcGxpa2F0aW9uZW4genUgdmVybWVpZGVuLCBiaXR0ZSBpbW1lciBBa3RlbnplaWNoZW4gYW5n
ZWJlbi4gwqBBbmJlaSBlaW4gYW5tZWxkZWZvcm11bGFyLCBiaXR0ZSBhdXNmw7xsbGVuIHVuZCB6
dXLDvGNrIFBlciBlbWFpbCBhbjpiZXJhdGVyZ2FicmllbC5zcEBjb25zdWx0YW50LmNvbSBvZGVy
IGFucnVmZW46ICAzNCA2MDIgODEwMTg1ICYgRmF4OiAgMzQgOTMxIDcwIDIxMjAgZGllIHNpY2hl
cmhlaXRzZmlybWEgU2FudGFsdWNpYSBTaWNoZXJoZWl0c2Zpcm1hLgrCoApIRVJaTElDSEVOIEdM
VUNLV1VOU0NI4oCmIQpNaXQgZnJldW5kbGljaGVuIEdyw7zDn2VuCk1BUklBIEhJREFMR08KVkla
RVBSw4RTSURFTlRJTgrCoApCw5xSTyxTQU5UQUxVQ0lBIFNFR1VST1MgUy5BIEVzcGHDsWEgClBs
YXphIEVzcGHDsWEsIDE1IC0gLTE2IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgCk1hZHJpZCwgMjgwMDggRXNwYcOxYQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoArCoApBTk1FTERFRk9STVVMQVIgWlVSIEdFV0lOTkFOU1BSVUNIUwpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18gCkJpdHRlIGbDvGxsZW4g
U2llIGRhcyBGb3JtdWxhciBzb3JnZsOkbHRpZyBhdXMgdW5kIHNlbmRlbiBlcyBwZXIgZSBtYWls
OnNhbnRhbHVjaWEuc2cuZXNAc3BhaW5tYWlsLmNvbSBhbiBkZXIgU2FudGFsdWNpYSBTaWNoZXJo
ZWl0c2Zpcm1hIG1pdCBLb3BpZSBJaHJlcyBQZXJzb25hbGF1c3dlaXNlcyBvZGVyIFJlaXNlcGFz
c2VzLgrCoApHRVdJTk5CRVRSQUc6X19fX18gQUtURU5aRUlDSEVOIF9fX19fX19fX18KTkFNRTpf
X19fX19fX19fX18gVk9STkFNRTpfX19fX19fX19fX19fX19fXwpHRUJVUlRTREFUVU06X19fX19O
QVRJT05BTElUQVRfX19fX19fX19fX19fCkxPU05VTU1FUjpfX19fX19fX19fXyBHTMOcQ0tTWkFI
TEVOIF9fX19fX19fClNUUkFTU0U6X19fX19fX19fX19fX19fIE5VTU1FUjpfX19fX19fX19fX19f
CldPSE5PUlQ6X19fX18gUE9TVExFSVRaQUhMX19fX19MQU5EIF9fX19fX19fCkRpcmVrdGVyIEtv
bnRha3QgRS1NYWlsX19fX19fX19fX19fX19fX19fX19fClRFTEVGT046X19fX19fX19fXyBIQU5E
WTpfX19fX19fX19fIEZBWDpfX19fXwpCRVJVRjpfX19fXyBGQU1JTElFTlNUQU5EOl9fX19fKEdF
U0NITEVDSFQpX19fIMKgIMKgCsKgCldFTENIRSBaQUhMVU5HU0ZPUk0gQkVWT1JaVUdFTiBTSUU/
IMKgKEEpIEJBTkvDnEJFUldFSVNVTkc6IMKgKEIpIEJBUlNDSEVDSyDCoApCQU5LREFURU4gU0lO
RCBOVVIgTk9UV0VORElHIFdFTk4gU0lFIFNJQ0ggRsOcUiBFSU5FIEJBTkvDnEJFUldFSVNVTkcg
RU5UU0NISUVERU4gSEFCRU4uCsKgCk5BTUUgREVTIEdFTERJTlNUSVRVVFM6X19fX19fX19fX19f
X18KS09OVE9OVU1NRVI6X19fX19fX19fX19fX19fX19fX19fX19fIApJQkFOOl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KQkFOSyBBRERSRVNTOl9fX19fX19fX19fX19fX19fX19fX19f
XwoKwqAKwqAgwqAgIEVSS0zDhFJVTkcgREVTIEJFR8OcTlNUSUdURU4KSUNIIF9fX19fX19fX19f
X19fX19fX19fX19fX19fX0JFU1TDhFRJR0UgSElFUk1JVCwgREFTUyBBTExFIElORk9STUFUSU9O
RU4sIEtPUlJFS1QgU0lORCwgVU5EIERJRSBWRVJBTlNUQUxURVIgREVSIEVsIFNQQU5JU0ggTE9U
VEVSWSAvIFNBTlRBTFVDSUEgU0lDSEVSSEVJVFNGSVJNQSBOSUNIVCBWRVJBTlRXT1JUTElDSCBH
RU1BQ0hUIFdFUkRFTiwgV0VOTiBFUyBaVSBFSU5FUiBVTkJFUkVDSFRJR1RFTiBaQUhMVU5HIERV
UkNIIFVOR0VOQVVFIElORk9STUFUSU9ORU4sIERJRSBJQ0ggSU4gRElFU0VNIEZPUk1VTEFSIEFO
R0VCRSBLT01NVC5EQVNTIDEwJSBQUk9WSVNJT04gREVSIFNBTlRBIExVQ0lBIFNFQ1VSSVRZIENP
TVBBTlkgR0VIP1JFTiwgU09CQUxEIFNJRSBJSFJFTiBHRVdJTk4gRk9ORFMgRVJIQUxURU4uIERJ
RVNFIFpFSE4gUFJPWkVOVCBXRVJERU4gSUhORU4gU09GT1JUIFpVUsOcQ0tHRUdFQkVOLCBTSUUg
RVJIQUxURU4gSUhSRU4gR0VXSU5OIEFVRiBJSFJFTSBLT05UTy4gKEFDSFRVTkcgV2lyIGJpdHRl
biBTaWUsIGF1ZiBkaWVzZSBFLU1haWwtQWRyZXNzZSB6dSBhbnR3b3J0ZW4oc2FudGFsdWNpYS5z
Zy5lc0BzcGFpbm1haWwuY29tKSBCw5xSTy1LT05UT0lORk9STUFUSU9ORU4tSUJBTiBFUzE3IDIx
MDAgNTYyNCAxMTAyIDAwMTEgNzcxOSBTV0lGVCBDT0RFOiBDQUlYRVNCQlhYWC4gwqBLT05UT05B
TUUsTEEgUExBQ0lUQSBERUwgTUlSQURPUiBTLkwgU1BBSU4uClVyaGViZXJyZWNodMKpIDIwMDIt
MjAyMCBNdWx0aS1TdGFhdCBMb3R0ZXJpZSBWZXJiYW5kLiBBbGxlIFJlY2h0ZQoKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVs
IG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRw
czovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVs
Cg==
