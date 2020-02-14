Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C4E15DB84
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 14 Feb 2020 16:49:25 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j2dDW-0004eN-0b; Fri, 14 Feb 2020 15:49:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sashal@kernel.org>) id 1j2dDV-0004eD-7G
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 14 Feb 2020 15:49:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=t9AU4MWpi+8KwMpUhWqUqPX13jY56yg1GxkMo/06Qpo=; b=QDUnSxaoP+0Deoi0ZK20B1+hyN
 Oj3SK0toBeOHI/GtZtIvXRo83BS6Ahq43SOvicU5Laks3jSPdBBRyfKX7NyEBHZ5sbQqBSPjAR3bh
 URoNUWkdohae4MrYQNxwUkSVSP3nV58iL/wKPDq6QYRAshMVfuUt2KxgHPgYEt37wf6M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=t9AU4MWpi+8KwMpUhWqUqPX13jY56yg1GxkMo/06Qpo=; b=UqwiVjaI7peVVTJPT1dSTLY+h9
 5rMk/n080UE/XtsFIfRIW31xmeLLt1Dnpb6hGwXyxAFCCFnPFMZXND2K7F4xOCn+MwiX3LQheZ5nB
 2ywbjSrnh27P7brz/l3fysAtjelWFLSjfNaYNGepfAY0YHdOwDBjKms+NvdSOgQ8z9QE=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j2dDT-0045Xf-Q3
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 14 Feb 2020 15:49:21 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 303742467D;
 Fri, 14 Feb 2020 15:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581695354;
 bh=D4GG98E9c9Y1icIuu9/OOXLVnOGJq8xtVvyjOWugdBc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=F8Sxij1ssfjFFSOAWM3Tq18XPsFsFrzWcsATZ9OMWb2dpM+0rUr0KFNRwt/xAaQ1Z
 VO8RGx8O+9fPCbb4W7J2lEqCyPxo22J/UP1/9B5HpjSW1eHmKffCyYa/gvd0+00rF/
 hDUkMPgSYlChsUI5sCTaWebvEewtypExroDS9kfQ=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Fri, 14 Feb 2020 10:40:07 -0500
Message-Id: <20200214154854.6746-15-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214154854.6746-1-sashal@kernel.org>
References: <20200214154854.6746-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j2dDT-0045Xf-Q3
Subject: [f2fs-dev] [PATCH AUTOSEL 5.5 015/542] f2fs: preallocate DIO blocks
 when forcing buffered_io
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
Cc: Sasha Levin <sashal@kernel.org>, Javier Gonzalez <javier@javigon.com>,
 Damien Le Moal <damien.lemoal@wdc.com>, linux-f2fs-devel@lists.sourceforge.net,
 Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

RnJvbTogSmFlZ2V1ayBLaW0gPGphZWdldWtAa2VybmVsLm9yZz4KClsgVXBzdHJlYW0gY29tbWl0
IDQ3NTAxZjg3YzYxYWQyYWEyMzRhZGQ2M2UxYWUyMzE1MjFkYmMzZjUgXQoKVGhlIHByZXZpb3Vz
IHByZWFsbG9jYXRpb24gYW5kIERJTyBkZWNpc2lvbiBsaWtlIGJlbG93LgoKICAgICAgICAgICAg
ICAgICAgICAgICAgIGFsbG93X291dHBsYWNlX2RpbyAgICAgICAgICAgICAgIWFsbG93X291dHBs
YWNlX2RpbwpmMmZzX2ZvcmNlX2J1ZmZlcmVkX2lvICAgKCopIE5vX1ByZWFsbG9jIC8gQnVmZmVy
ZWRfSU8gICBQcmVhbGxvYyAvIEJ1ZmZlcmVkX0lPCiFmMmZzX2ZvcmNlX2J1ZmZlcmVkX2lvICBO
b19QcmVhbGxvYyAvIERJTyAgICAgICAgICAgICAgIFByZWFsbG9jIC8gRElPCgpCdXQsIEphdmll
ciByZXBvcnRlZCBDYXNlICgqKSB3aGVyZSB6b25lZCBkZXZpY2UgYnlwYXNzZWQgcHJlYWxsb2Nh
dGlvbiBidXQKZmVsbCBiYWNrIHRvIGJ1ZmZlcmVkIHdyaXRlcyBpbiBmMmZzX2RpcmVjdF9JTygp
LCByZXN1bHRpbmcgaW4gc3RhbGUgZGF0YQpiZWluZyByZWFkLgoKSW4gb3JkZXIgdG8gZml4IHRo
ZSBpc3N1ZSwgYWN0dWFsbHkgd2UgbmVlZCB0byBwcmVhbGxvY2F0ZSBibG9ja3Mgd2hlbmV2ZXIK
d2UgZmFsbCBiYWNrIHRvIGJ1ZmZlcmVkIElPIGxpa2UgdGhpcy4gTm8gY2hhbmdlIGlzIG1hZGUg
aW4gdGhlIG90aGVyIGNhc2VzLgoKICAgICAgICAgICAgICAgICAgICAgICAgIGFsbG93X291dHBs
YWNlX2RpbyAgICAgICAgICAgICAgIWFsbG93X291dHBsYWNlX2RpbwpmMmZzX2ZvcmNlX2J1ZmZl
cmVkX2lvICAgKCopIFByZWFsbG9jIC8gQnVmZmVyZWRfSU8gICAgICBQcmVhbGxvYyAvIEJ1ZmZl
cmVkX0lPCiFmMmZzX2ZvcmNlX2J1ZmZlcmVkX2lvICBOb19QcmVhbGxvYyAvIERJTyAgICAgICAg
ICAgICAgIFByZWFsbG9jIC8gRElPCgpSZXBvcnRlZC1hbmQtdGVzdGVkLWJ5OiBKYXZpZXIgR29u
emFsZXogPGphdmllckBqYXZpZ29uLmNvbT4KU2lnbmVkLW9mZi1ieTogRGFtaWVuIExlIE1vYWwg
PGRhbWllbi5sZW1vYWxAd2RjLmNvbT4KVGVzdGVkLWJ5OiBTaGluJ2ljaGlybyBLYXdhc2FraSA8
c2hpbmljaGlyby5rYXdhc2FraUB3ZGMuY29tPgpSZXZpZXdlZC1ieTogQ2hhbyBZdSA8eXVjaGFv
MEBodWF3ZWkuY29tPgpSZXZpZXdlZC1ieTogSmF2aWVyIEdvbnrDoWxleiA8amF2aWVyQGphdmln
b24uY29tPgpTaWduZWQtb2ZmLWJ5OiBKYWVnZXVrIEtpbSA8amFlZ2V1a0BrZXJuZWwub3JnPgpT
aWduZWQtb2ZmLWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+Ci0tLQogZnMvZjJm
cy9kYXRhLmMgfCAxMyAtLS0tLS0tLS0tLS0tCiBmcy9mMmZzL2ZpbGUuYyB8IDQzICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgMzMg
aW5zZXJ0aW9ucygrKSwgMjMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZnMvZjJmcy9kYXRh
LmMgYi9mcy9mMmZzL2RhdGEuYwppbmRleCBhMDM0Y2QwY2UwMjE3Li5mYzQwYTcyZjc4MjdmIDEw
MDY0NAotLS0gYS9mcy9mMmZzL2RhdGEuYworKysgYi9mcy9mMmZzL2RhdGEuYwpAQCAtMTE4MCwx
OSArMTE4MCw2IEBAIGludCBmMmZzX3ByZWFsbG9jYXRlX2Jsb2NrcyhzdHJ1Y3Qga2lvY2IgKmlv
Y2IsIHN0cnVjdCBpb3ZfaXRlciAqZnJvbSkKIAlpbnQgZXJyID0gMDsKIAlib29sIGRpcmVjdF9p
byA9IGlvY2ItPmtpX2ZsYWdzICYgSU9DQl9ESVJFQ1Q7CiAKLQkvKiBjb252ZXJ0IGlubGluZSBk
YXRhIGZvciBEaXJlY3QgSS9PKi8KLQlpZiAoZGlyZWN0X2lvKSB7Ci0JCWVyciA9IGYyZnNfY29u
dmVydF9pbmxpbmVfaW5vZGUoaW5vZGUpOwotCQlpZiAoZXJyKQotCQkJcmV0dXJuIGVycjsKLQl9
Ci0KLQlpZiAoZGlyZWN0X2lvICYmIGFsbG93X291dHBsYWNlX2Rpbyhpbm9kZSwgaW9jYiwgZnJv
bSkpCi0JCXJldHVybiAwOwotCi0JaWYgKGlzX2lub2RlX2ZsYWdfc2V0KGlub2RlLCBGSV9OT19Q
UkVBTExPQykpCi0JCXJldHVybiAwOwotCiAJbWFwLm1fbGJsayA9IEYyRlNfQkxLX0FMSUdOKGlv
Y2ItPmtpX3Bvcyk7CiAJbWFwLm1fbGVuID0gRjJGU19CWVRFU19UT19CTEsoaW9jYi0+a2lfcG9z
ICsgaW92X2l0ZXJfY291bnQoZnJvbSkpOwogCWlmIChtYXAubV9sZW4gPiBtYXAubV9sYmxrKQpk
aWZmIC0tZ2l0IGEvZnMvZjJmcy9maWxlLmMgYi9mcy9mMmZzL2ZpbGUuYwppbmRleCAxM2FlZjVm
MjhmYThmLi4zM2M0MTJkMTc4ZjBmIDEwMDY0NAotLS0gYS9mcy9mMmZzL2ZpbGUuYworKysgYi9m
cy9mMmZzL2ZpbGUuYwpAQCAtMzM4MywxOCArMzM4Myw0MSBAQCBzdGF0aWMgc3NpemVfdCBmMmZz
X2ZpbGVfd3JpdGVfaXRlcihzdHJ1Y3Qga2lvY2IgKmlvY2IsIHN0cnVjdCBpb3ZfaXRlciAqZnJv
bSkKIAkJCQlyZXQgPSAtRUFHQUlOOwogCQkJCWdvdG8gb3V0OwogCQkJfQotCQl9IGVsc2Ugewot
CQkJcHJlYWxsb2NhdGVkID0gdHJ1ZTsKLQkJCXRhcmdldF9zaXplID0gaW9jYi0+a2lfcG9zICsg
aW92X2l0ZXJfY291bnQoZnJvbSk7CisJCQlnb3RvIHdyaXRlOworCQl9CiAKLQkJCWVyciA9IGYy
ZnNfcHJlYWxsb2NhdGVfYmxvY2tzKGlvY2IsIGZyb20pOwotCQkJaWYgKGVycikgewotCQkJCWNs
ZWFyX2lub2RlX2ZsYWcoaW5vZGUsIEZJX05PX1BSRUFMTE9DKTsKLQkJCQlpbm9kZV91bmxvY2so
aW5vZGUpOwotCQkJCXJldCA9IGVycjsKLQkJCQlnb3RvIG91dDsKLQkJCX0KKwkJaWYgKGlzX2lu
b2RlX2ZsYWdfc2V0KGlub2RlLCBGSV9OT19QUkVBTExPQykpCisJCQlnb3RvIHdyaXRlOworCisJ
CWlmIChpb2NiLT5raV9mbGFncyAmIElPQ0JfRElSRUNUKSB7CisJCQkvKgorCQkJICogQ29udmVy
dCBpbmxpbmUgZGF0YSBmb3IgRGlyZWN0IEkvTyBiZWZvcmUgZW50ZXJpbmcKKwkJCSAqIGYyZnNf
ZGlyZWN0X0lPKCkuCisJCQkgKi8KKwkJCWVyciA9IGYyZnNfY29udmVydF9pbmxpbmVfaW5vZGUo
aW5vZGUpOworCQkJaWYgKGVycikKKwkJCQlnb3RvIG91dF9lcnI7CisJCQkvKgorCQkJICogSWYg
Zm9yY2VfYnVmZmVyZV9pbygpIGlzIHRydWUsIHdlIGhhdmUgdG8gYWxsb2NhdGUKKwkJCSAqIGJs
b2NrcyBhbGwgdGhlIHRpbWUsIHNpbmNlIGYyZnNfZGlyZWN0X0lPIHdpbGwgZmFsbAorCQkJICog
YmFjayB0byBidWZmZXJlZCBJTy4KKwkJCSAqLworCQkJaWYgKCFmMmZzX2ZvcmNlX2J1ZmZlcmVk
X2lvKGlub2RlLCBpb2NiLCBmcm9tKSAmJgorCQkJCQlhbGxvd19vdXRwbGFjZV9kaW8oaW5vZGUs
IGlvY2IsIGZyb20pKQorCQkJCWdvdG8gd3JpdGU7CisJCX0KKwkJcHJlYWxsb2NhdGVkID0gdHJ1
ZTsKKwkJdGFyZ2V0X3NpemUgPSBpb2NiLT5raV9wb3MgKyBpb3ZfaXRlcl9jb3VudChmcm9tKTsK
KworCQllcnIgPSBmMmZzX3ByZWFsbG9jYXRlX2Jsb2Nrcyhpb2NiLCBmcm9tKTsKKwkJaWYgKGVy
cikgeworb3V0X2VycjoKKwkJCWNsZWFyX2lub2RlX2ZsYWcoaW5vZGUsIEZJX05PX1BSRUFMTE9D
KTsKKwkJCWlub2RlX3VubG9jayhpbm9kZSk7CisJCQlyZXQgPSBlcnI7CisJCQlnb3RvIG91dDsK
IAkJfQord3JpdGU6CiAJCXJldCA9IF9fZ2VuZXJpY19maWxlX3dyaXRlX2l0ZXIoaW9jYiwgZnJv
bSk7CiAJCWNsZWFyX2lub2RlX2ZsYWcoaW5vZGUsIEZJX05PX1BSRUFMTE9DKTsKIAotLSAKMi4y
MC4xCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNl
Zm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xp
bnV4LWYyZnMtZGV2ZWwK
