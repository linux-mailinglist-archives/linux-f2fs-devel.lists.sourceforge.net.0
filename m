Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 031A8325B86
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 26 Feb 2021 03:15:46 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lFSfQ-0002KA-Iv; Fri, 26 Feb 2021 02:15:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1lFSfP-0002Jz-9P
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 26 Feb 2021 02:15:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WF8VpnyzHdgViMj630oZNB120GiE5wchXl478FybgbU=; b=cnzcrcNosrqiPOry7CxxQdF5Qp
 34HII3MVDkAJgaQ5xdmalDAm4xddpZyfTWuZeh8Cp/XloSJCR2h6JYVwIiVtU/XJbuvwCW+HOr+xY
 NkEPh4FgamFqPGEjB7t7NYJ6HYF9advnjg8fZcla3Tqpq4Icm5UyxH5X2l3cXxWa+zS0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WF8VpnyzHdgViMj630oZNB120GiE5wchXl478FybgbU=; b=CiVY8bS6SZoxKUkgQkDv9wYBJt
 ex1pe7zkhPqyx1WLEo5xxC0g2x6gLTSPdFhbkEFB/clpCLREX8K55H7aNW5ZUn5iALFcN//xRugkd
 dn710gZIAwmmAH7bxtN0jfo9kEKd1gg4VvDnQnytwm8yKa8jg81jIFU1iuu1Yyn/4KZM=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lFSfF-0000Qv-M8
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 26 Feb 2021 02:15:43 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id C0E8164EF5;
 Fri, 26 Feb 2021 02:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614305723;
 bh=+24u6XMY4WfQ/a0wNzIwknMb5GmaXdJ5COacjbeXKHA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GVhjMDf0gr3PW+o1GsVPO7MumHDcb4u8nkiz7jHzvVoNJsSYbRT/OBYO5VVcU624o
 5lqY29011//QicZvkpTqdwYRPK/HrCSXTARR1kd+X6sYnw3ak4g4ooONeNmQLbCYGd
 U+oqAIKMLEesvaQhmy9kiItXQ9UzTBYryTdrT70e8Uoa8UGwl2o9toP1USciy+/edr
 FxKojG28hwir+1Jq5sS7b+Wwo8kB1iBtQPaoh+qMnHi4bHQ74VbntiWelfHsAd36g9
 piAAtml8SRgSWwJoc7/XTrGJnwV9QkBG8A9sJEL2HYyfmUOt48ClI7YFE8ShigQegS
 qRYa0sJhWClvg==
Date: Thu, 25 Feb 2021 18:15:21 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: heyunlei 00015531 <heyunlei@hihonor.com>
Message-ID: <YDhZuaF8lEQPtBmp@sol.localdomain>
References: <20210223112425.19180-1-heyunlei@hihonor.com>
 <c1ce1421-2576-5b48-322c-fa682c7510d7@kernel.org>
 <YDbbGSsd6ibKOpzT@sol.localdomain>
 <YDbdEEcEV5bzgtL6@sol.localdomain>
 <fae4a2f9-b1c9-e673-cefe-fe024ce6f9ab@hihonor.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fae4a2f9-b1c9-e673-cefe-fe024ce6f9ab@hihonor.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: hihonor.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lFSfF-0000Qv-M8
Subject: Re: [f2fs-dev] [PATCH] f2fs: fsverity: Truncate cache pages if set
 verity failed
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
Cc: jaegeuk@kernel.org, linux-fscrypt@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gRnJpLCBGZWIgMjYsIDIwMjEgYXQgMDk6NDI6MzNBTSArMDgwMCwgaGV5dW5sZWkgMDAwMTU1
MzEgd3JvdGU6Cj4gCj4g5ZyoIDIwMjEvMi8yNSA3OjExLCBFcmljIEJpZ2dlcnMg5YaZ6YGTOgo+
ID4gT24gV2VkLCBGZWIgMjQsIDIwMjEgYXQgMDM6MDI6NTJQTSAtMDgwMCwgRXJpYyBCaWdnZXJz
IHdyb3RlOgo+ID4gPiBIaSBZdW5sZWksCj4gPiA+IAo+ID4gPiBPbiBXZWQsIEZlYiAyNCwgMjAy
MSBhdCAwOToxNjoyNFBNICswODAwLCBDaGFvIFl1IHdyb3RlOgo+ID4gPiA+IEhpIFl1bmxlaSwK
PiA+ID4gPiAKPiA+ID4gPiBPbiAyMDIxLzIvMjMgMTk6MjQsIGhleXVubGVpIHdyb3RlOgo+ID4g
PiA+ID4gSWYgZmlsZSBlbmFibGUgdmVyaXR5IGZhaWxlZCwgc2hvdWxkIHRydW5jYXRlIGFueXRo
aW5nIHdyb3RlCj4gPiA+ID4gPiBwYXN0IGlfc2l6ZSwgaW5jbHVkaW5nIGNhY2hlIHBhZ2VzLgo+
ID4gPiA+ICtDYyBFcmljLAo+ID4gPiA+IAo+ID4gPiA+IEFmdGVyIGZhaWx1cmUgb2YgZW5hYmxp
bmcgdmVyaXR5LCB3ZSB3aWxsIHNlZSB2ZXJpdHkgbWV0YWRhdGEgaWYgd2UgdHJ1bmNhdGUKPiA+
ID4gPiBmaWxlIHRvIGxhcmdlciBzaXplIGxhdGVyPwo+ID4gPiA+IAo+ID4gPiA+IFRoYW5rcywK
PiBIaSBFcmlj77yMCj4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBoZXl1bmxlaSA8aGV5dW5sZWlA
aGlob25vci5jb20+Cj4gPiA+ID4gPiAtLS0KPiA+ID4gPiA+ICAgIGZzL2YyZnMvdmVyaXR5LmMg
fCA0ICsrKy0KPiA+ID4gPiA+ICAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKPiA+ID4gPiA+IAo+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvdmVy
aXR5LmMgYi9mcy9mMmZzL3Zlcml0eS5jCj4gPiA+ID4gPiBpbmRleCAwNTRlYzg1MmI1ZWEuLmYx
ZjliOTM2MWE3MSAxMDA2NDQKPiA+ID4gPiA+IC0tLSBhL2ZzL2YyZnMvdmVyaXR5LmMKPiA+ID4g
PiA+ICsrKyBiL2ZzL2YyZnMvdmVyaXR5LmMKPiA+ID4gPiA+IEBAIC0xNzAsOCArMTcwLDEwIEBA
IHN0YXRpYyBpbnQgZjJmc19lbmRfZW5hYmxlX3Zlcml0eShzdHJ1Y3QgZmlsZSAqZmlscCwgY29u
c3Qgdm9pZCAqZGVzYywKPiA+ID4gPiA+ICAgIAl9Cj4gPiA+ID4gPiAgICAJLyogSWYgd2UgZmFp
bGVkLCB0cnVuY2F0ZSBhbnl0aGluZyB3ZSB3cm90ZSBwYXN0IGlfc2l6ZS4gKi8KPiA+ID4gPiA+
IC0JaWYgKGRlc2MgPT0gTlVMTCB8fCBlcnIpCj4gPiA+ID4gPiArCWlmIChkZXNjID09IE5VTEwg
fHwgZXJyKSB7Cj4gPiA+ID4gPiArCQl0cnVuY2F0ZV9pbm9kZV9wYWdlcyhpbm9kZS0+aV9tYXBw
aW5nLCBpbm9kZS0+aV9zaXplKTsKPiA+ID4gPiA+ICAgIAkJZjJmc190cnVuY2F0ZShpbm9kZSk7
Cj4gPiA+ID4gPiArCX0KPiA+ID4gPiA+ICAgIAljbGVhcl9pbm9kZV9mbGFnKGlub2RlLCBGSV9W
RVJJVFlfSU5fUFJPR1JFU1MpOwo+ID4gPiA+ID4gCj4gQnkgdGhlIHdhee+8jHNob3VsZMKgIHdl
IGNvbnNpZGVywqAgc2V0IHhhdHRyIGZhaWxlZD8KPiAKClllcywgdGhhdCBzZWVtcyB0byBiZSBh
bm90aGVyIG92ZXJzaWdodC4gIFNpbWlsYXJseSBmb3IgZXh0NCwgaWYKZXh0NF9qb3VybmFsX3N0
YXJ0KCksIGV4dDRfb3JwaGFuX2RlbCgpLCBvciBleHQ0X3Jlc2VydmVfaW5vZGVfd3JpdGUoKSBm
YWlscy4KCkkgdGhpbmsgdGhlIHJpZ2h0IGZpeCBpcyB0byBtb3ZlIHRoZSB0cnVuY2F0aW9uIHRv
IHRoZSBlbmQgb2YgdGhlIGZ1bmN0aW9uLgoKLSBFcmljCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QK
TGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
