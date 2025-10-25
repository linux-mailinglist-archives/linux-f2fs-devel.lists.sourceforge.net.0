Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E453C09348
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 25 Oct 2025 18:11:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cks5c2ZoXCFNG/iA36PxYpCqOb9uj+qY0JgfB6QHaBU=; b=Lz+wtTuxnK5MQYgyNOJSY0mqF1
	amfo9X2cFxwXgls2NNHixrYmPlyMeFeOxqzQ3j7imSFCGB4vPSNB82mkgYV53SqiTIBxlkCuRg/wB
	ntO5TQFzjx14D8neSXuUQi1uIu9IAzk8pDW4vU/qIweCskCMYGA8mEUaY6oSr2qhm5+Q=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vCgrB-0008Hj-ME;
	Sat, 25 Oct 2025 16:11:05 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sashal@kernel.org>) id 1vCgqp-0008Gv-6E
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 25 Oct 2025 16:10:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XxzQxVTqjKYrPD0RCChfxlnuSXc4z6XBw9tsMQWzqYE=; b=Uo2SyCqgkm6HKrKxRKEHVtvttO
 cmXSO0E5i/E7eqcTVMooBchXpKOLsPfFaxJR06A/moyK/fSV+5E+IKhY9o/SUIpNiut4GOrOLvagU
 pVtYnOtde1BztscKWwu/WQ++pMW7g5DVwjvEYgBhW44HZP9IH6DShYfRtnYCRaVZ5PmQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XxzQxVTqjKYrPD0RCChfxlnuSXc4z6XBw9tsMQWzqYE=; b=WUUz6/V7eiU4NLFO+kmgCdu+YI
 AOS82nC1eZiMdxy3KIvuImdGgT9KJluTKIv5KeSsdZ5YLJni0PyZ+FM+IXb1L/Lrn7ECxTeHoNh95
 sLfF0AY9vvOUkAIXcyx6/XTxZlGrKq/vmF7qEoSzvKL+eNjPwrqa7bxJe0D8NX9VpnCo=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vCgqZ-00037i-GY for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 25 Oct 2025 16:10:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 95CA260465;
 Sat, 25 Oct 2025 16:10:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9193DC4CEF5;
 Sat, 25 Oct 2025 16:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761408616;
 bh=ZB6MMGsHom3hrtuy3Yx15fuq2M6wnBgRV0eXr75fs5Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EZkoNMyDINbtGdhrrmgJMXe62Zt1KTNnGhRRW+S9195uK9jtAb4JfIjV+Jw9Gx22b
 uoSa2fPFN0H6bB+lDFKtl1QcWwXuXG9g+O8VSJYwVsx1FDp6WUm+7HIUshoMwOj9DQ
 2Q6mqSojWktRCYwZfY4799Ss2gU4yEFPtvltESwMdWoszkfpbGkj0bb/lLnYc3qPmF
 cDM6hwiGw9jdZDcMnu0A31OmzvInNPSPc3h9L+yjFWNkYt7kWipmHBM08FPHVqCcWW
 ISy1XQEi/e3gGv+Sj1re4WC+5z6/Gbwz09Wg7InKJACGok2jXduZoD19jDc/CvOxtM
 uxGY4llyPHQ2Q==
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Date: Sat, 25 Oct 2025 11:54:17 -0400
Message-ID: <20251025160905.3857885-26-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251025160905.3857885-1-sashal@kernel.org>
References: <20251025160905.3857885-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.5
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: wangzijie <wangzijie1@honor.com> [ Upstream commit
 23361bd54966b437e1ed3eb1a704572f4b279e58
 ] When we get wrong extent info data, and look up extent_node in rb tree,
 it will cause infinite loop (CONFIG_F2FS_CHECK_FS=n). Avoiding this by return
 NULL and print some kernel messages in that case. 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vCgqZ-00037i-GY
Subject: [f2fs-dev] [PATCH AUTOSEL 6.17-6.6] f2fs: fix infinite loop in
 __insert_extent_tree()
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
From: Sasha Levin via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Sasha Levin <sashal@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 wangzijie <wangzijie1@honor.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

RnJvbTogd2FuZ3ppamllIDx3YW5nemlqaWUxQGhvbm9yLmNvbT4KClsgVXBzdHJlYW0gY29tbWl0
IDIzMzYxYmQ1NDk2NmI0MzdlMWVkM2ViMWE3MDQ1NzJmNGIyNzllNTggXQoKV2hlbiB3ZSBnZXQg
d3JvbmcgZXh0ZW50IGluZm8gZGF0YSwgYW5kIGxvb2sgdXAgZXh0ZW50X25vZGUgaW4gcmIgdHJl
ZSwKaXQgd2lsbCBjYXVzZSBpbmZpbml0ZSBsb29wIChDT05GSUdfRjJGU19DSEVDS19GUz1uKS4g
QXZvaWRpbmcgdGhpcyBieQpyZXR1cm4gTlVMTCBhbmQgcHJpbnQgc29tZSBrZXJuZWwgbWVzc2Fn
ZXMgaW4gdGhhdCBjYXNlLgoKU2lnbmVkLW9mZi1ieTogd2FuZ3ppamllIDx3YW5nemlqaWUxQGhv
bm9yLmNvbT4KUmV2aWV3ZWQtYnk6IENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4KU2lnbmVkLW9m
Zi1ieTogSmFlZ2V1ayBLaW0gPGphZWdldWtAa2VybmVsLm9yZz4KU2lnbmVkLW9mZi1ieTogU2Fz
aGEgTGV2aW4gPHNhc2hhbEBrZXJuZWwub3JnPgotLS0KCkxMTSBHZW5lcmF0ZWQgZXhwbGFuYXRp
b25zLCBtYXkgYmUgY29tcGxldGVseSBib2d1czoKCllFUwotIGBmcy9mMmZzL2V4dGVudF9jYWNo
ZS5jOjYwMS02MTNgIG5vdyBkZXRlY3RzIG92ZXJsYXBwaW5nL2V4dCBjb3JydXB0CiAgZXh0ZW50
cyB3aGlsZSB3YWxraW5nIHRoZSByYi10cmVlLCByZXBvcnRzIHRoZSBjb3JydXB0aW9uIHdpdGgK
ICBgZjJmc19lcnJfcmF0ZWxpbWl0ZWRgLCBhbmQgcmV0dXJucyBgTlVMTGAgaW5zdGVhZCBvZiBz
cGlubmluZwogIGZvcmV2ZXI7IHdpdGhvdXQgdGhpcyBmaXgsIHRoZSBsb29wIG5ldmVyIGFkdmFu
Y2VzIHdoZW4KICBgZjJmc19idWdfb24oKWAgb25seSB3YXJucyAoc2VlIGBmcy9mMmZzL2YyZnMu
aDozNC00MWApLCBzbwogIENPTkZJR19GMkZTX0NIRUNLX0ZTPW4ga2VybmVscyBoaXQgYSBoYXJk
IGhhbmcuCi0gVGhlIG5ldyBlcnJvciBwYXRoIHN0aWxsIHJhaXNlcyBgZjJmc19idWdfb24oKWAg
c28gZGVidWcgYnVpbGRzIGtlZXAKICB0aGUgZXhpc3RpbmcgQlVHX09OIGNyYXNoIHNlbWFudGlj
cywgYnV0IHByb2R1Y3Rpb24gYnVpbGRzIGZpbmFsbHkKICBicmVhayBvdXQgYW5kIG1hcmsgdGhl
IGZpbGVzeXN0ZW0gZGlydHksIHByZXZlbnRpbmcgYSBsaXZlbG9jayB3aGlsZQogIHN0aWxsIGZs
YWdnaW5nIHRoZSBjb3JydXB0aW9uIGZvciBmc2Nr4oCUbWVldGluZyBzdGFibGXigJlzIOKAnHNl
cmlvdXMgdXNlci0KICB2aXNpYmxlIGJ1Z+KAnSBjcml0ZXJpb24uCi0gQ2FsbGVycyBhbHJlYWR5
IGNvcGUgd2l0aCBhIGBOVUxMYCByZXR1cm4gZnJvbQogIGBfX2luc2VydF9leHRlbnRfdHJlZSgp
YCAoZS5nLiBgZnMvZjJmcy9leHRlbnRfY2FjaGUuYzo3NDQtNzYzYCwKICA4MTctODMwKSwgYmVj
YXVzZSBhbGxvY2F0aW9uIGZhaWx1cmVzIGhhZCB0byBiZSB0b2xlcmF0ZWQgYmVmb3JlOyB0aGUK
ICBjaGFuZ2UgdGhlcmVmb3JlIGNhcnJpZXMgbWluaW1hbCByZWdyZXNzaW9uIHJpc2sgYW5kIHN0
YXlzIGNvbmZpbmVkIHRvCiAgZXh0ZW50LWNhY2hlIGVycm9yIGhhbmRsaW5nIHJhdGhlciB0aGFu
IHRvdWNoaW5nIG5vcm1hbCBmYXN0IHBhdGhzLgoKR2l2ZW4gdGhlIHNldmVyZSBoYW5nIGl0IGVs
aW1pbmF0ZXMgYW5kIHRoZSB2ZXJ5IGxvY2FsaXplZCwgbG93LXJpc2sKZml4LCB0aGlzIGlzIGEg
c29saWQgY2FuZGlkYXRlIGZvciBiYWNrcG9ydGluZyB0byB0aGUgc3RhYmxlIHRyZWVzLgoKIGZz
L2YyZnMvZXh0ZW50X2NhY2hlLmMgfCA2ICsrKysrKwogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0
aW9ucygrKQoKZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZXh0ZW50X2NhY2hlLmMgYi9mcy9mMmZzL2V4
dGVudF9jYWNoZS5jCmluZGV4IDE5OWMxZTdhODNlZjMuLmJhMGEwN2JmZDM0NjMgMTAwNjQ0Ci0t
LSBhL2ZzL2YyZnMvZXh0ZW50X2NhY2hlLmMKKysrIGIvZnMvZjJmcy9leHRlbnRfY2FjaGUuYwpA
QCAtNjA0LDcgKzYwNCwxMyBAQCBzdGF0aWMgc3RydWN0IGV4dGVudF9ub2RlICpfX2luc2VydF9l
eHRlbnRfdHJlZShzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksCiAJCQlwID0gJigqcCktPnJiX3Jp
Z2h0OwogCQkJbGVmdG1vc3QgPSBmYWxzZTsKIAkJfSBlbHNlIHsKKwkJCWYyZnNfZXJyX3JhdGVs
aW1pdGVkKHNiaSwgIiVzOiBjb3JydXB0ZWQgZXh0ZW50LCB0eXBlOiAlZCwgIgorCQkJCSJleHRl
bnQgbm9kZSBpbiByYiB0cmVlIFsldSwgJXUsICV1XSwgYWdlIFslbGx1LCAlbGx1XSwgIgorCQkJ
CSJleHRlbnQgbm9kZSB0byBpbnNlcnQgWyV1LCAldSwgJXVdLCBhZ2UgWyVsbHUsICVsbHVdIiwK
KwkJCQlfX2Z1bmNfXywgZXQtPnR5cGUsIGVuLT5laS5mb2ZzLCBlbi0+ZWkuYmxrLCBlbi0+ZWku
bGVuLCBlbi0+ZWkuYWdlLAorCQkJCWVuLT5laS5sYXN0X2Jsb2NrcywgZWktPmZvZnMsIGVpLT5i
bGssIGVpLT5sZW4sIGVpLT5hZ2UsIGVpLT5sYXN0X2Jsb2Nrcyk7CiAJCQlmMmZzX2J1Z19vbihz
YmksIDEpOworCQkJcmV0dXJuIE5VTEw7CiAJCX0KIAl9CiAKLS0gCjIuNTEuMAoKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVs
IG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRw
czovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVs
Cg==
