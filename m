Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD85161FF4
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Feb 2020 05:56:45 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j3uw8-0003hm-8s; Tue, 18 Feb 2020 04:56:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <david@fromorbit.com>) id 1j3uw7-0003hd-Kx
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 18 Feb 2020 04:56:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=q7GTPYc5wh2JNtnlJtrdJL3bgU7vjiqmNh78/1cdmf4=; b=laQybICU1grVNtkvbeKYKZGDKP
 F8TVfNRA/288X/ax4dvcpf/AHi5oUOJGBTzb1mbALSJ3eEbah0GLIbXnsrrtNfAkSx652FKUYY5SO
 gP0EEDI4F1qEOo8yg4jbFUBta5ThO0UoTZZ1khEXMMI9y3r080EkNnclcP9hQiT4tJVg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=q7GTPYc5wh2JNtnlJtrdJL3bgU7vjiqmNh78/1cdmf4=; b=fgHlSJSIz0hVp3dJQQchZC7w7r
 Wzc/a8TWaHpiBZkBy+wBiPwspNStn7GMg0+sG4V5Hyz0le62XQxFOAdtyiQIgxrYCAYwawYxKqVK8
 A5llw0KZYP6+3ZYyRll9WzoXNUPfaASbGShIIj13Xv7kDYaSfQ0fsudHk/skaHU8Z4MM=;
Received: from mail105.syd.optusnet.com.au ([211.29.132.249])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtp (Exim 4.92.2)
 id 1j3uw5-0072Bu-No
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 18 Feb 2020 04:56:43 +0000
Received: from dread.disaster.area (pa49-179-138-28.pa.nsw.optusnet.com.au
 [49.179.138.28])
 by mail105.syd.optusnet.com.au (Postfix) with ESMTPS id A528E3A263E;
 Tue, 18 Feb 2020 15:56:35 +1100 (AEDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
 (envelope-from <david@fromorbit.com>)
 id 1j3uvy-0005p2-0S; Tue, 18 Feb 2020 15:56:34 +1100
Date: Tue, 18 Feb 2020 15:56:33 +1100
From: Dave Chinner <david@fromorbit.com>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200218045633.GH10776@dread.disaster.area>
References: <20200217184613.19668-1-willy@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200217184613.19668-1-willy@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.3 cv=X6os11be c=1 sm=1 tr=0
 a=zAxSp4fFY/GQY8/esVNjqw==:117 a=zAxSp4fFY/GQY8/esVNjqw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=l697ptgUJYAA:10
 a=JfrnYn6hAAAA:8 a=VwQbUJbxAAAA:8 a=i0EeH86SAAAA:8 a=7-415B0cAAAA:8
 a=XVPaj5jkfHni625HrT0A:9 a=QEXdDO2ut3YA:10 a=1CNFftbPRP8L7MoqJWF3:22
 a=AjGcO6oz07-iQ99wixmX:22 a=biEYGPWJfzWAr4FL6Ov7:22
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j3uw5-0072Bu-No
Subject: Re: [f2fs-dev] [PATCH v6 00/19] Change readahead API
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
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
 linux-mm@kvack.org, ocfs2-devel@oss.oracle.com, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gTW9uLCBGZWIgMTcsIDIwMjAgYXQgMTA6NDU6NDFBTSAtMDgwMCwgTWF0dGhldyBXaWxjb3gg
d3JvdGU6Cj4gRnJvbTogIk1hdHRoZXcgV2lsY294IChPcmFjbGUpIiA8d2lsbHlAaW5mcmFkZWFk
Lm9yZz4KPiAKPiBUaGlzIHNlcmllcyBhZGRzIGEgcmVhZGFoZWFkIGFkZHJlc3Nfc3BhY2Ugb3Bl
cmF0aW9uIHRvIGV2ZW50dWFsbHkKPiByZXBsYWNlIHRoZSByZWFkcGFnZXMgb3BlcmF0aW9uLiAg
VGhlIGtleSBkaWZmZXJlbmNlIGlzIHRoYXQKPiBwYWdlcyBhcmUgYWRkZWQgdG8gdGhlIHBhZ2Ug
Y2FjaGUgYXMgdGhleSBhcmUgYWxsb2NhdGVkIChhbmQKPiB0aGVuIGxvb2tlZCB1cCBieSB0aGUg
ZmlsZXN5c3RlbSkgaW5zdGVhZCBvZiBwYXNzaW5nIHRoZW0gb24gYQo+IGxpc3QgdG8gdGhlIHJl
YWRwYWdlcyBvcGVyYXRpb24gYW5kIGhhdmluZyB0aGUgZmlsZXN5c3RlbSBhZGQKPiB0aGVtIHRv
IHRoZSBwYWdlIGNhY2hlLiAgSXQncyBhIG5ldCByZWR1Y3Rpb24gaW4gY29kZSBmb3IgZWFjaAo+
IGltcGxlbWVudGF0aW9uLCBtb3JlIGVmZmljaWVudCB0aGFuIHdhbGtpbmcgYSBsaXN0LCBhbmQg
c29sdmVzCj4gdGhlIGRpcmVjdC13cml0ZSB2cyBidWZmZXJlZC1yZWFkIHByb2JsZW0gcmVwb3J0
ZWQgYnkgeXUga3VhaSBhdAo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWZzZGV2ZWwv
MjAyMDAxMTYwNjM2MDEuMzkyMDEtMS15dWt1YWkzQGh1YXdlaS5jb20vCj4gCj4gVGhlIG9ubHkg
dW5jb252ZXJ0ZWQgZmlsZXN5c3RlbXMgYXJlIHRob3NlIHdoaWNoIHVzZSBmc2NhY2hlLgo+IFRo
ZWlyIGNvbnZlcnNpb24gaXMgcGVuZGluZyBEYXZlIEhvd2VsbHMnIHJld3JpdGUgd2hpY2ggd2ls
bCBtYWtlIHRoZQo+IGNvbnZlcnNpb24gc3Vic3RhbnRpYWxseSBlYXNpZXIuCgpMYXRlc3QgdmVy
c2lvbiBpbiB5b3VyIGdpdCB0cmVlOgoKJCDilrYgZ2xvIC1uIDUgd2lsbHkvcmVhZGFoZWFkCjRi
ZTQ5NzA5NmMwNCBtbTogVXNlIG1lbWFsbG9jX25vZnNfc2F2ZSBpbiByZWFkYWhlYWQgcGF0aApm
ZjYzNDk3ZmNiOTggaW9tYXA6IENvbnZlcnQgZnJvbSByZWFkcGFnZXMgdG8gcmVhZGFoZWFkCjI2
YWVlNjBlODliNSBpb21hcDogUmVzdHJ1Y3R1cmUgaW9tYXBfcmVhZHBhZ2VzX2FjdG9yCjgxMTVi
Y2NhNzMxMiBmdXNlOiBDb252ZXJ0IGZyb20gcmVhZHBhZ2VzIHRvIHJlYWRhaGVhZAozZGIzZDEw
ZDllYTEgZjJmczogQ29udmVydCBmcm9tIHJlYWRwYWdlcyB0byByZWFkYWhlYWQKJAoKbWVyZ2Vk
IGludG8gYSA1LjYtcmMyIHRyZWUgZmFpbHMgYXQgYm9vdCBvbiBteSB0ZXN0IHZtOgoKWyAgICAy
LjQyMzExNl0gLS0tLS0tLS0tLS0tWyBjdXQgaGVyZSBdLS0tLS0tLS0tLS0tClsgICAgMi40MjQ5
NTddIGxpc3RfYWRkIGRvdWJsZSBhZGQ6IG5ldz1mZmZmZWEwMDBlZmZmNGM4LCBwcmV2PWZmZmY4
ODgzYmZmZmVlNjAsIG5leHQ9ZmZmZmVhMDAwZWZmZjRjOC4KWyAgICAyLjQyODI1OV0gV0FSTklO
RzogQ1BVOiA0IFBJRDogMSBhdCBsaWIvbGlzdF9kZWJ1Zy5jOjI5IF9fbGlzdF9hZGRfdmFsaWQr
MHg2Ny8weDcwClsgICAgMi40MzA2MTddIENQVTogNCBQSUQ6IDEgQ29tbTogc2ggTm90IHRhaW50
ZWQgNS42LjAtcmMyLWRnYysgIzE4MDAKWyAgICAyLjQzMjQwNV0gSGFyZHdhcmUgbmFtZTogUUVN
VSBTdGFuZGFyZCBQQyAoaTQ0MEZYICsgUElJWCwgMTk5NiksIEJJT1MgMS4xMi4wLTEgMDQvMDEv
MjAxNApbICAgIDIuNDM0NzQ0XSBSSVA6IDAwMTA6X19saXN0X2FkZF92YWxpZCsweDY3LzB4NzAK
WyAgICAyLjQzNjEwN10gQ29kZTogYzYgNGMgODkgY2EgNDggYzcgYzcgMTAgNDEgNTggODIgZTgg
NTUgMjkgODkgZmYgMGYgMGIgMzEgYzAgYzMgNDggODkgZjIgNGMgODkgYzEgNDggODkgZmUgNDgg
YzcgYzcgNjAgNDEgNTggODIgZTggM2IgMjkgODkgZmYgPDBmPiAwYiAzMSBjNwpbICAgIDIuNDQx
MTYxXSBSU1A6IDAwMDA6ZmZmZmM5MDAwMThhM2JiMCBFRkxBR1M6IDAwMDEwMDgyClsgICAgMi40
NDI1NDhdIFJBWDogMDAwMDAwMDAwMDAwMDAwMCBSQlg6IGZmZmZlYTAwMGVmZmY0YzAgUkNYOiAw
MDAwMDAwMDAwMDAwMjU2ClsgICAgMi40NDQ0MzJdIFJEWDogMDAwMDAwMDAwMDAwMDAwMSBSU0k6
IDAwMDAwMDAwMDAwMDAwODYgUkRJOiBmZmZmZmZmZjgyODhhOGIwClsgICAgMi40NDYzMTVdIFJC
UDogZmZmZmVhMDAwZWZmZjRjOCBSMDg6IGZmZmZjOTAwMDE4YTNhNjUgUjA5OiAwMDAwMDAwMDAw
MDAwMjU2ClsgICAgMi40NDgxOTldIFIxMDogMDAwMDAwMDAwMDAwMDAwOCBSMTE6IGZmZmZjOTAw
MDE4YTNhNjUgUjEyOiBmZmZmZWEwMDBlZmZmNGM4ClsgICAgMi40NTAwNzJdIFIxMzogZmZmZjg4
ODNiZmZmZWU2MCBSMTQ6IDAwMDAwMDAwMDAwMDAwMTAgUjE1OiAwMDAwMDAwMDAwMDAwMDAxClsg
ICAgMi40NTE5NTldIEZTOiAgMDAwMDAwMDAwMDAwMDAwMCgwMDAwKSBHUzpmZmZmODg4M2I5YzAw
MDAwKDAwMDApIGtubEdTOjAwMDAwMDAwMDAwMDAwMDAKWyAgICAyLjQ1NDA4M10gQ1M6ICAwMDEw
IERTOiAwMDAwIEVTOiAwMDAwIENSMDogMDAwMDAwMDA4MDA1MDAzMwpbICAgIDIuNDU1NjA0XSBD
UjI6IDAwMDAwMDAwZmZmZmZmZmYgQ1IzOiAwMDAwMDAwM2I5YTM3MDAyIENSNDogMDAwMDAwMDAw
MDA2MGVlMApbICAgIDIuNDU3NDg0XSBDYWxsIFRyYWNlOgpbICAgIDIuNDU4MTcxXSAgX19wYWdl
dmVjX2xydV9hZGRfZm4rMHgxNWYvMHgyYzAKWyAgICAyLjQ1OTM3Nl0gIHBhZ2V2ZWNfbHJ1X21v
dmVfZm4rMHg4Ny8weGQwClsgICAgMi40NjA1MDBdICA/IHBhZ2V2ZWNfbW92ZV90YWlsX2ZuKzB4
MmQwLzB4MmQwClsgICAgMi40NjE3MTJdICBscnVfYWRkX2RyYWluX2NwdSsweDhkLzB4MTYwClsg
ICAgMi40NjI3ODddICBscnVfYWRkX2RyYWluKzB4MTgvMHgyMApbICAgIDIuNDYzNzU3XSAgc2hp
ZnRfYXJnX3BhZ2VzKzB4YjgvMHgxODAKWyAgICAyLjQ2NDc4OV0gID8gdnByaW50a19lbWl0KzB4
MTAxLzB4MWMwClsgICAgMi40NjU4MTNdICA/IHByaW50aysweDU4LzB4NmYKWyAgICAyLjQ2NjY1
OV0gIHNldHVwX2FyZ19wYWdlcysweDIwNS8weDI0MApbICAgIDIuNDY3NzE2XSAgbG9hZF9lbGZf
YmluYXJ5KzB4MzRhLzB4MTU2MApbICAgIDIuNDY4Nzg5XSAgPyBnZXRfdXNlcl9wYWdlc19yZW1v
dGUrMHgxNTkvMHgyODAKWyAgICAyLjQ3MDAyNF0gID8gc2VsaW51eF9pbm9kZV9wZXJtaXNzaW9u
KzB4MTBkLzB4MWUwClsgICAgMi40NzEzMjNdICA/IF9yYXdfcmVhZF91bmxvY2srMHhhLzB4MjAK
WyAgICAyLjQ3MjM3NV0gID8gbG9hZF9taXNjX2JpbmFyeSsweDJiMi8weDQxMApbICAgIDIuNDcz
NDkyXSAgc2VhcmNoX2JpbmFyeV9oYW5kbGVyKzB4NjAvMHhlMApbICAgIDIuNDc0NjM0XSAgX19k
b19leGVjdmVfZmlsZS5pc3JhLjArMHg1MTIvMHg4NTAKWyAgICAyLjQ3NTg4OF0gID8gcmVzdF9p
bml0KzB4YzYvMHhjNgpbICAgIDIuNDc2ODAxXSAgZG9fZXhlY3ZlKzB4MjEvMHgzMApbICAgIDIu
NDc3NjcxXSAgdHJ5X3RvX3J1bl9pbml0X3Byb2Nlc3MrMHgxMC8weDM0ClsgICAgMi40Nzg4NTVd
ICBrZXJuZWxfaW5pdCsweGUyLzB4ZmEKWyAgICAyLjQ3OTc3Nl0gIHJldF9mcm9tX2ZvcmsrMHgx
Zi8weDMwClsgICAgMi40ODA3MzddIC0tLVsgZW5kIHRyYWNlIGU3NzA3OWRlOWIyMmRjNmEgXS0t
LQoKSSBqdXN0IGRyb3BwZWQgdGhlIGV4dDQgY29udmVyc2lvbiBmcm9tIG15IGxvY2FsIHRyZWUg
c28gSSBjYW4gYm9vdAp0aGUgbWFjaGluZSBhbmQgdGVzdCBYRlMuIE1pZ2h0IGhhdmUgc29tZSBt
b3JlIGluZm8gd2hlbiB0aGF0CmNyYXNoZXMgYW5kIGJ1cm5zLi4uCgpDaGVlcnMsCgpEYXZlLgot
LSAKRGF2ZSBDaGlubmVyCmRhdmlkQGZyb21vcmJpdC5jb20KCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlz
dApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNv
dXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
