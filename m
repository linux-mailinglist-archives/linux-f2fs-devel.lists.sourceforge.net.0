Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D28EEA854FE
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 11 Apr 2025 09:10:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u38WZ-0005Lk-H9;
	Fri, 11 Apr 2025 07:10:02 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1u38WP-0005Kn-Mx
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 11 Apr 2025 07:09:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RJVKznhoKE31edltCrPMTscou/s5CMU5orOC/JpiOXc=; b=Dk7PbhE1DV8XR1Q3uAUKG2Y89+
 IU+x6EoUOyHLTwrXW0Q3dHmzDfIrkMxBFpnjTk5Sc7wDAV/VARfKnKcmYniRcbZmZ3BrZAacNe5wd
 W2gSkFkpY0W3GbqSssK5ifFee29mhMjQMx+Go5ucjaLFoWBjY0fSynTyEHsbr3i7Id3U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RJVKznhoKE31edltCrPMTscou/s5CMU5orOC/JpiOXc=; b=XUdmJCo24M+Pgmom2QQ17EYA2Z
 bHTzb086kho9nrBh+UULrLZSD5VZaSOwisLIJRrUuYJIXg+KxhD9d204d5aOT9sdexpWHiKXrWaSy
 QJDq1qxfqgbc6Aa2/mLUA+FaHZI7feIjw5tSK2yGqXOWOveOLc7F0GJb5Moohx1C6fvA=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1u38W7-00082r-Ea for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 11 Apr 2025 07:09:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4C95443F0E;
 Fri, 11 Apr 2025 07:09:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDBD7C4CEE2;
 Fri, 11 Apr 2025 07:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744355365;
 bh=bBGmAuAdgPpEB+vx+ewOf54ZlO5xTrbWkrQnX5coLn4=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=uKabz1BR52DQQfN+sQrHzmhaOInUB1DNEdpjzR7CKOPdtqxLX5hGOj1/KeTMJRnyq
 esueYkEJzfgDrBo7ZmJd3xGZpmDi1P2qKM3Z77eGOWIsjD3g/xDGF+ZVSDupHeEXeC
 8s4XMRaHmSPdTcR1YhIxBeQ/+VdElGYoC3oY04Mxp8ouXYkPCdsY8D5y8WrmsKSq/a
 zkc+0CTULMCZzDSiuIcu+zwxPYsPjDfRcQHBIu2DQtX9xA0P/8CnkjBGuo2STD3Tn2
 C6IjBHrjy8JSx2AvfZq3oqkKPRUmXX9Q96xHjSBaQOf0rJlGZR3F/SEE6SFTQ6uIVP
 jVqnSAnidl/iw==
Message-ID: <6a5ce71f-2068-48ac-b4ba-1b766ead79cf@kernel.org>
Date: Fri, 11 Apr 2025 15:09:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Juhyung Park <qkrwngud825@gmail.com>
References: <CAD14+f3D6iPOBxEgkZxxTsXCfwRKb9ph68JtUk3H9cn8ovLt9w@mail.gmail.com>
 <b5a8a872-5d62-424d-8af4-fb9a4a29385e@kernel.org>
 <CAD14+f3D+rFDDLp4-Po_i85U7LyknUQwFSYgZkJq-6s-wuAhTg@mail.gmail.com>
 <00a7102c-6fdc-4172-9461-d7023703a041@kernel.org>
Content-Language: en-US
In-Reply-To: <00a7102c-6fdc-4172-9461-d7023703a041@kernel.org>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2025/4/11 15:08, Chao Yu wrote: > On 2025/4/11 3:08, Juhyung
    Park wrote: >> Hi Chao, >> >> On Thu, Apr 10, 2025 at 7:56 AM Chao Yu <chao@kernel.org>
    wrote: >>> >>> On 2025/4/10 16:32, Juhyung Par [...] 
 
 Content analysis details:   (-0.9 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [172.234.252.31 listed in sa-accredit.habeas.com]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                            [172.234.252.31 listed in bl.score.senderscore.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1u38W7-00082r-Ea
Subject: Re: [f2fs-dev] Reproducing resize corruption
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: uplinkr@airmail.cc, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyNS80LzExIDE1OjA4LCBDaGFvIFl1IHdyb3RlOgo+IE9uIDIwMjUvNC8xMSAzOjA4LCBK
dWh5dW5nIFBhcmsgd3JvdGU6Cj4+IEhpIENoYW8sCj4+Cj4+IE9uIFRodSwgQXByIDEwLCAyMDI1
IGF0IDc6NTbigK9BTSBDaGFvIFl1IDxjaGFvQGtlcm5lbC5vcmc+IHdyb3RlOgo+Pj4KPj4+IE9u
IDIwMjUvNC8xMCAxNjozMiwgSnVoeXVuZyBQYXJrIHdyb3RlOgo+Pj4+IEhpIGV2ZXJ5b25lLgo+
Pj4+Cj4+Pj4gQmVzaWRlcyBzYWx2YWdpbmcgQHVwbGlua3IncyBkYXRhIFsxXSwgSSBmaWd1cmVk
IGl0J3MgaW1wb3J0YW50IGZvciB1cwo+Pj4+IHRvIHVuZGVyc3RhbmQgd2h5IHJlc2l6ZSBjb3Jy
dXB0cyBkYXRhIGluIHRoZSBmaXJzdCBwbGFjZS4KPj4+Cj4+PiBZZXMsIEkgZmVlbCB0aGUgc2Ft
ZSB3aXRoIHlvdS4KPj4+Cj4+Pj4KPj4+PiBJIHRvb2sgc29tZSB0aW1lIHRvZGF5IHRvIGhhdmUg
bXkgbGFwdG9wJ3MgMS44VGlCIGYyZnMgcGFydGl0aW9uCj4+Pj4gcmVzaXplZCBzbGlnaHRseSBh
bmQgbWFuYWdlZCB0byByZXByb2R1Y2UgdGhlIGRhdGEgY29ycnVwdGlvbi4KPj4+Pgo+Pj4+IEkn
bSBub3QgbmVjZXNzYXJpbHkgc3VyZSB3aGV0aGVyIHRoaXMgd291bGQgYmUgdGhlIHNhbWUgc3lt
cHRvbXMgYXMKPj4+PiBAdXBsaW5rcidzLCBidXQgaXQncyBwcm9iYWJseSBsaWtlbHkuCj4+Pgo+
Pj4gVGhhbmtzIGZvciB0aGUgcXVpY2sgcmVwcm9kdWNpbmcsIGFuZCBnb29kIGNhdGNoIQo+Pj4K
Pj4+Pgo+Pj4+IEhlcmUncyB3aGF0IEkgZGlkOgo+Pj4+IDEuIFJlbW91bnRlZCB0byBjaGVja3Bv
aW50PWRpc2FibGUKPj4+PiAyLiBDcmVhdGUgYSBkbS1zbmFwc2hvdCBvZiB0aGUgY3VycmVudCBy
b290IGRldmljZQo+Pj4+IDMuIE1vdW50IHNuYXBzaG90IHRvIHJlcGxheSB0aGUgbG9nCj4+Pj4g
NC4gVW5tb3VudAo+Pj4+IDUuIFJlc2l6ZSBzZWN0b3IgNDg3MjQ4ODk2IHRvIDQ4NjUzOTI2NAo+
Pj4KPj4+IEB1cGxpbmtyJ3MgY2FzZSBpcyBleHBhbmRpbmcgcGFydGl0aW9uLCBub3QgdGhlIHNh
bWUgdy8gc2hyaW5rIG9uZS4KPj4KPj4gSXQgbXVzdCBoYXZlIGdvbmUgdGhyb3VnaCBzaHJpbmsg
YW5kIGV4cGFuZCwgdGhhdCdzIGhvdyBncGFydGVkIHdvcmtzIGlpcmMuCj4+Cj4+IFRvIGJlIHNw
ZWNpZmljLCBoaXMgY2FzZSB3YXMgZXhwYW5kaW5nIHRoZSBwYXJ0aXRpb24gdG8gYSBkaWZmZXJl
bnQKPj4gb2Zmc2V0LiBUbyByZWR1Y2UgdGltZSByZXF1aXJlZCBmb3IgdGhpcywgZ3BhcnRlZCBm
aXJzdCBzaHJpbmtzIHRoZQo+PiBwYXJ0aXRpb24gYXMgbXVjaCBhcyBpdCBjYW4gaW5wbGFjZSwg
YW5kIHRoZW4gbW92ZSBpdCB0byB0aGUgbmV3Cj4+IG9mZnNldCwgYW5kIHRoZW4gZXhwYW5kIGl0
IGJhY2sgdG8gZnVsbCBzaXplLiBNYXliZSB0aGlzIHNjZW5hcmlvCj4+IHByb2R1Y2VzIHNvbWUg
YnVnPwo+Pgo+Pj4KPj4+PiAjIC4vcmVzaXplLmYyZnMgLWQgMyAtcyAtaSAvZGV2L21hcHBlci9z
bmFwIC10IDQ4NjUzOTI2NAo+Pj4KPj4+IEFsc28sIEkgZGlkbid0IHNlZSBsYXJnZV9uYXRfYml0
bWFwIGZsYWcgaW4gaGlzIGZzY2subG9nLgo+Pj4KPj4+Pgo+Pj4+IExhdGVzdCBmMmZzLXRvb2xz
IHdhcyB1c2VkOgo+Pj4+IDMzYzViOTUzOWFmMiBmMmZzX2lvOiBhZGQgZnJhZ3JlYWQgY29tbWFu
ZCB0byBldmFsdWF0ZSBmcmFnbWVudGVkCj4+Pj4gYnVmZmVyIGZvciByZWFkcwo+Pj4+Cj4+Pj4g
VGhpcyByZXByb2R1Y2VkIHRoZSBtb3VudCBhbmQgZnNjayBmYWlsdXJlLgo+Pj4+Cj4+Pj4gTW91
bnQgbG9nOgo+Pj4+IFs0NDI0MzEuMDIwNTk0XSBGMkZTLWZzIChkbS0yKTogaW52YWxpZCBjcmNf
b2Zmc2V0OiAwCj4+Pj4gWzQ0MjQzMS4xMzAwNTVdIEYyRlMtZnMgKGRtLTIpOiBTSVQgaXMgY29y
cnVwdGVkIG5vZGUjIDEzNjE1MjAxIHZzIDEzNjE2MjkwCj4+Pj4gWzQ0MjQzMS4xMzk2ODRdIEYy
RlMtZnMgKGRtLTIpOiBGYWlsZWQgdG8gaW5pdGlhbGl6ZSBGMkZTIHNlZ21lbnQgbWFuYWdlciAo
LTExNykKPj4+Cj4+PiBJIHRyaWVkOgo+Pj4KPj4+IGEpIHJlc2l6ZS5mMmZzIC1kIDMgLXMgLWkg
aW1nIC10ICRzZWN0b3JzCj4+PiBiKSByZXNpemUuZjJmcyAtZCAzIC1zIGltZyAtdCAkc2VjdG9y
cwo+IAo+IGMpIHJlc2l6ZS5mMmZzIC1kIDMgLWkgaW1nIC10ICRzZWN0b3JzIChleHBhbmRpbmcp
LCB0aGUgcm9vdCBjYXVzZSBzZWVtcwo+IGNvbmZsaWN0IGJldHdlZW4gLWkgYW5kIC1zIG9wdGlv
biBpbiBzaHJpbmsgbW9kZSByZXNpemUuCgpTb3JyeSwKCmMpIHJlc2l6ZS5mMmZzIC1kIDMgLWkg
aW1nIC10ICRzZWN0b3JzIChleHBhbmRpbmcpIHdvbid0IHRyaWdnZXIgdGhlIGJ1Zy4KClRoYW5r
cywKCj4gCj4gVGhhbmtzLAo+IAo+Pj4KPj4+IE9ubHkgYSkgY2FuIHJlcHJvZHVjZSB0aGUgYnVn
LCB3ZSBuZWVkIHRvIHJldmVydCAtaSBzdXBwb3J0IGZvciByZXNpemUKPj4+IGZpcnN0Lgo+Pgo+
PiBVZ2gsIEkgc3VzcGVjdGVkIHRoaXMgY291bGQgYmUgdGhlIGRldGVybWluaW5nIGZhY3RvciA6
KAo+Pgo+PiBTbyBAdXBsaW5rcidzIGNhc2UgaXMgYSBkaWZmZXJlbnQgY3VscHJpdCBvbmUuIEkn
bGwgdHJ5IHRvIHJlcHJvZHVjZQo+PiBzb21ldGhpbmcgd2l0aCBteSBwaG9uZSB3aGljaCBkb2Vz
bid0IHVzZSBsYXJnZV9uYXRfYml0bWFwLgo+Pgo+Pj4KPj4+IFRoYW5rcywKPj4+Cj4+Pj4KPj4+
PiBkZWJ1Z2ZzICYgcmVzaXplIGxvZzoKPj4+PiBodHRwczovL2FydGVyOTcuY29tLy5mMmZzLTIw
MjUwNDEwLwo+Pj4+Cj4+Pj4gVGhlIGZzY2sgbG9nIHdhcyB3YXkgdG9vIGxhcmdlLCA4LjIxR2lC
IHdpdGhvdXQgIi1kIiBmbGFnIGFuZCBpdAo+Pj4+IGNvbnRhaW5lZCBtYW55IHNlbnNpdGl2ZSBk
YXRhLCBzbyBJJ20gbm90IHVwbG9hZGluZyBpdCBmb3Igbm93Lgo+Pj4+Cj4+Pj4gICAgRnJvbSBs
b29raW5nIGF0IHRoZSBkbSBzdGF0cywgdGhlIGZzY2sgYWxzbyB3cm90ZSAyMTM4IE1pQiB0byB0
aGUKPj4+PiBzbmFwc2hvdCBkZXZpY2UuCj4+Pj4KPj4+PiBDaGFvLCBjYW4gd2Ugc3RhcnQgZnJv
bSBoZXJlPwo+Pj4+IFRoYW5rcy4KPj4+Pgo+Pj4+IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9saW51eC1mMmZzLWRldmVsLzYwOGYyM2NlLTU2ZWYtNGZhZi1iZWUxLTNhYTg5Nzg2ZWQ0MUBr
ZXJuZWwub3JnL1QvI21jNjI4ZjhmM2NhNmM3MzE3OGZmYTE3MTZmOTI3NzU1NTI3ODU2ZDRiCj4+
Pgo+IAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJj
ZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9s
aW51eC1mMmZzLWRldmVsCg==
