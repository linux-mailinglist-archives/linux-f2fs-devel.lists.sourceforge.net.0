Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3CF878C68
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 12 Mar 2024 02:42:48 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rjrA5-0004HD-EL;
	Tue, 12 Mar 2024 01:42:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rjrA3-0004H4-8u
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 12 Mar 2024 01:42:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Cc:To:From:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7EZA0ro8+0LAyK5QvRTjRjyLCaCNn+XiawKtuat+3jk=; b=Mt/DA+n9811AjIIsXDWlthynrl
 LSSHmin/kyiHJ3n8Vz9tpMHGz7f01zKcPIsgPdAXS8s/KaedeZ4Ap3wL3lYAujE/sEaXJy5aZw2Gw
 KBqGuDrJrNOvBGRQo0OtHTIk/h+58EH2Pro00LkrkEuSxLO0vrUEwI/EzWu/jQE0GhTg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:From:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7EZA0ro8+0LAyK5QvRTjRjyLCaCNn+XiawKtuat+3jk=; b=A5aQ6CgpS4kyZsemxTwZY8RnnJ
 MHlE7Xm1/ZSs81+aN8rVHMPy0p8w0TeYa5ra124Z9yY49gOPEsq7T2mG0LyJEn9bRsoRLMumpWhjq
 Ja941NtK7ePBA5Bmqsc64bBYJ4lmtVSRpgb1w5QD1vnBBxyOKfUTw1awc1xo3SPXOz5s=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rjr9r-0002V4-Am for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 12 Mar 2024 01:42:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 9C004CE124A
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 12 Mar 2024 01:42:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D7FBC433C7;
 Tue, 12 Mar 2024 01:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710207741;
 bh=SvN91sVbn4Vcb6UyAAUWB0V+z3nlk1QHgidCJdScNrk=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=J6TsgF5ftbA35AqVO1Q2CglrqxDO3Q5WHOa/iQrhqXWFwJvjZwkLqKWv0sJLnsf+O
 wUoAY5lW+/1b50HuWVX5n3CWtAE++4SOS1ZiCoWgphuytr+FK6lntn7BX8md6EkgWP
 QXLtdMghvxs9ar269OXVUz9EPPFEtBNyA+StNYFMg0vvXTo9gXedjn1teNrleGnU+S
 wfQ5ao5XVjkeZLG/SgnOTMlsJEI6ss0vvpfkLfccnG9AJUDBQnwpqFUvE48jErhtzE
 V0enq+VMRrCqsCUot13bKYch70Tj4xomHD0gIGtx+lw195+zXsE/Lxw4IqIGXInNZU
 XJMZQOUupaPCg==
Message-ID: <5f335b3b-7edc-458f-819d-40012b61672a@kernel.org>
Date: Tue, 12 Mar 2024 09:42:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20240206032513.2495025-1-chao@kernel.org>
 <ZcQd3DtIpiA5P9DQ@google.com>
 <8e69aa15-9779-4696-98ab-f173666a87a7@kernel.org>
 <23aa8351-e002-4185-89c7-ccde6b5b0549@kernel.org>
In-Reply-To: <23aa8351-e002-4185-89c7-ccde6b5b0549@kernel.org>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Ping, Jaegeuk, do you have any comments on this patch? Thanks,
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rjr9r-0002V4-Am
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to return EIO when reading after
 device removal
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

UGluZywKCkphZWdldWssIGRvIHlvdSBoYXZlIGFueSBjb21tZW50cyBvbiB0aGlzIHBhdGNoPwoK
VGhhbmtzLAoKT24gMjAyNC8yLzI2IDE2OjAwLCBDaGFvIFl1IHdyb3RlOgo+IEFueSBjb21tZW50
cz8KPiAKPiBUaGFua3MsCj4gCj4gT24gMjAyNC8yLzE5IDExOjEzLCBDaGFvIFl1IHdyb3RlOgo+
PiBPbiAyMDI0LzIvOCA4OjE4LCBKYWVnZXVrIEtpbSB3cm90ZToKPj4+IE9uIDAyLzA2LCBDaGFv
IFl1IHdyb3RlOgo+Pj4+IGdlbmVyaWMvNzMwIDJzIC4uLiAtIG91dHB1dCBtaXNtYXRjaCAoc2Vl
IC9tZWRpYS9mc3Rlc3RzL3Jlc3VsdHMvL2dlbmVyaWMvNzMwLm91dC5iYWQpCj4+Pj4gwqDCoMKg
wqAgLS0tIHRlc3RzL2dlbmVyaWMvNzMwLm91dMKgwqDCoCAyMDIzLTA4LTA3IDAxOjM5OjUxLjA1
NTU2ODQ5OSArMDAwMAo+Pj4+IMKgwqDCoMKgICsrKyAvbWVkaWEvZnN0ZXN0cy9yZXN1bHRzLy9n
ZW5lcmljLzczMC5vdXQuYmFkwqDCoMKgIDIwMjQtMDItMDYgMDI6MjY6NDMuMDAwMDAwMDAwICsw
MDAwCj4+Pj4gwqDCoMKgwqAgQEAgLTEsMiArMSBAQAo+Pj4+IMKgwqDCoMKgwqAgUUEgb3V0cHV0
IGNyZWF0ZWQgYnkgNzMwCj4+Pj4gwqDCoMKgwqAgLWNhdDogLTogSW5wdXQvb3V0cHV0IGVycm9y
Cj4+Pj4gwqDCoMKgwqAgLi4uCj4+Pj4gwqDCoMKgwqAgKFJ1biAnZGlmZiAtdSAvbWVkaWEvZnN0
ZXN0cy90ZXN0cy9nZW5lcmljLzczMC5vdXQgL21lZGlhL2ZzdGVzdHMvcmVzdWx0cy8vZ2VuZXJp
Yy83MzAub3V0LmJhZCfCoCB0byBzZWUgdGhlIGVudGlyZSBkaWZmKQo+Pj4+IFJhbjogZ2VuZXJp
Yy83MzAKPj4+PiBGYWlsdXJlczogZ2VuZXJpYy83MzAKPj4+PiBGYWlsZWQgMSBvZiAxIHRlc3Rz
Cj4+Pj4KPj4+PiBUaGlzIHBhdGNoIGFkZHMgYSBjaGVjayBjb25kaXRpb24gaW4gZjJmc19maWxl
X3JlYWRfaXRlcigpIHRvCj4+Pj4gZGV0ZWN0IGNwX2Vycm9yIHN0YXR1cyBhZnRlciBkZXZpY2Ug
cmVtb3ZhbCwgYW5kIHJldHJ1cm4gLUVJTwo+Pj4+IGZvciBzdWNoIGNhc2UuCj4+Pgo+Pj4gQ2Fu
IHdlIGNoZWNrIGRldmljZSByZW1vdmFsPwo+Pgo+PiBXZSBjYW4gdXNlIGJsa19xdWV1ZV9keWlu
ZygpIHRvIGRldGVjdCBkZXZpY2UgcmVtb3ZhbCwgYnV0LCBJTU8sIGRldmljZQo+PiByZW1vdmFs
IGNhbiBhbG1vc3Qgbm90IGhhcHBlbiBpbiBBbmRyb2lkLCBub3Qgc3VyZSBmb3IgZGlzdHJvcyBv
ciBzZXJ2ZXIsCj4+IGRvIHlvdSB3YW50IHRvIGFkZCB0aGlzIGNoZWNrIGNvbmRpdGlvbiBpbnRv
IGYyZnNfY3BfZXJyb3IoKT8KPj4KPj4gVGhhbmtzLAo+Pgo+Pj4KPj4+Pgo+Pj4+IFNpZ25lZC1v
ZmYtYnk6IENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4KPj4+PiAtLS0KPj4+PiDCoCBmcy9mMmZz
L2ZpbGUuYyB8IDMgKysrCj4+Pj4gwqAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+
Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZmlsZS5jIGIvZnMvZjJmcy9maWxlLmMKPj4+
PiBpbmRleCA0NWI3ZTM2MTBiMGYuLjllNDM4NmQ0MTQ0YyAxMDA2NDQKPj4+PiAtLS0gYS9mcy9m
MmZzL2ZpbGUuYwo+Pj4+ICsrKyBiL2ZzL2YyZnMvZmlsZS5jCj4+Pj4gQEAgLTQ0NjIsNiArNDQ2
Miw5IEBAIHN0YXRpYyBzc2l6ZV90IGYyZnNfZmlsZV9yZWFkX2l0ZXIoc3RydWN0IGtpb2NiICpp
b2NiLCBzdHJ1Y3QgaW92X2l0ZXIgKnRvKQo+Pj4+IMKgwqDCoMKgwqAgY29uc3QgbG9mZl90IHBv
cyA9IGlvY2ItPmtpX3BvczsKPj4+PiDCoMKgwqDCoMKgIHNzaXplX3QgcmV0Owo+Pj4+ICvCoMKg
wqAgaWYgKHVubGlrZWx5KGYyZnNfY3BfZXJyb3IoRjJGU19JX1NCKGlub2RlKSkpKQo+Pj4+ICvC
oMKgwqDCoMKgwqDCoCByZXR1cm4gLUVJTzsKPj4+PiArCj4+Pj4gwqDCoMKgwqDCoCBpZiAoIWYy
ZnNfaXNfY29tcHJlc3NfYmFja2VuZF9yZWFkeShpbm9kZSkpCj4+Pj4gwqDCoMKgwqDCoMKgwqDC
oMKgIHJldHVybiAtRU9QTk9UU1VQUDsKPj4+PiAtLSAKPj4+PiAyLjQwLjEKPj4KPj4KPj4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4gTGludXgtZjJm
cy1kZXZlbCBtYWlsaW5nIGxpc3QKPj4gTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3Jn
ZS5uZXQKPj4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGlu
dXgtZjJmcy1kZXZlbAo+IAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPiBMaW51eC1mMmZz
LWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+IGh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2Uu
bmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlz
dApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNv
dXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
