Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA736DC288
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 10 Apr 2023 04:08:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1plgwl-0000nM-Ep;
	Mon, 10 Apr 2023 02:07:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1plgwk-0000nG-Bd
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Apr 2023 02:07:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3X2St2AXz8cFTnIcaNjzl/OMdnufR20OS2/idPIu0Us=; b=PlgRFgih1MWgA30227XQAH9CZE
 hdbCuoUJWx/yq4V2YjagCzPw+mcQK0tZvlzHYArWX0dhDpllgBZ49NaNTx8bmRIZCbHaAskr/yZcF
 C2mV/1om8QfHk7plVchkKAUvLVV1pH0pSARcwXP+faXvf2CLTeYDeYVndrEQ2aHwrrU4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=3X2St2AXz8cFTnIcaNjzl/OMdnufR20OS2/idPIu0Us=; b=N
 MyRbbjgA88sV6fl4prw2ZhLr/WGHhP/T9YRnAp1hhCrUH5PmCXGPhh+4oDuK1RcFq/qKR0pCw3FZ8
 E0n6wFTwaXn8HcTmKZLQpqPHfuXeb9sWBf28i76Hoybo/KNLdB1HqOvS2h3YShDRVvjMiSWdSZ2j/
 CdyXxiYFSY2uqyWM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1plgwk-002Uqg-KA for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Apr 2023 02:07:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D8D9260C16
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 10 Apr 2023 02:07:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02D65C433D2;
 Mon, 10 Apr 2023 02:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681092460;
 bh=gvtVs77/FSkY/6eE8xO1TaHO2ECWAurgukRxLECf6AU=;
 h=From:To:Cc:Subject:Date:From;
 b=AlfMFPSJjjeVX4qUcR3E5MYpq56I6gyVHmEJO74PL1sijsNUxi5YJXVcoHhQU0Sht
 oOXxkTrqJ/A9hNKinEzkATncmB1DtxQ28OsaHM6Mx3BSndif2T4qpQtLotDy7uPqXd
 G8SbRKkiGRzK1b0umu6s4Z0BqxN50kt6EOtO5dvbZRXTDK5yVX89r3RExdrdsoE//T
 nuCkIyOHXfIbY27ulwOpwRfogQyNji9mrCEH+HdB1MSHhEyxD1er+rs5i6y2rPAaEw
 +h5coy8Qj5ylmCWTuBBB/UpdVVZi8VUrMMiZKFEia5BZrLdRXyGpdAF5WRgU3DD6eK
 glkAk2n187ojA==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Mon, 10 Apr 2023 10:07:24 +0800
Message-Id: <20230410020724.1817150-1-chao@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: xfstest generic/614 fails to run due to below reason:
 generic/614
 1s ... [not run] test requires delayed allocation buffered writes The root
 cause is f2fs tags wrong fiemap flag for delay allocated extent. 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1plgwk-002Uqg-KA
Subject: [f2fs-dev] [PATCH v2] f2fs: fix to tag FIEMAP_EXTENT_DELALLOC in
 fiemap() for delay allocated extent
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

eGZzdGVzdCBnZW5lcmljLzYxNCBmYWlscyB0byBydW4gZHVlIHRvIGJlbG93IHJlYXNvbjoKCmdl
bmVyaWMvNjE0IDFzIC4uLiBbbm90IHJ1bl0gdGVzdCByZXF1aXJlcyBkZWxheWVkIGFsbG9jYXRp
b24gYnVmZmVyZWQgd3JpdGVzCgpUaGUgcm9vdCBjYXVzZSBpcyBmMmZzIHRhZ3Mgd3JvbmcgZmll
bWFwIGZsYWcgZm9yIGRlbGF5IGFsbG9jYXRlZApleHRlbnQuCgpRdW90ZWQgZnJvbSBmaWVtYXAg
aW9jdGwgbWFudWFsIGZyb20gWzFdOgpGSUVNQVBfRVhURU5UX1VOS05PV04KVGhlIGxvY2F0aW9u
IG9mIHRoaXMgZXh0ZW50IGlzIGN1cnJlbnRseSB1bmtub3duLiBUaGlzIG1heQppbmRpY2F0ZSB0
aGUgZGF0YSBpcyBzdG9yZWQgb24gYW4gaW5hY2Nlc3NpYmxlIHZvbHVtZSBvciB0aGF0Cm5vIHN0
b3JhZ2UgaGFzIGJlZW4gYWxsb2NhdGVkIGZvciB0aGUgZmlsZSB5ZXQuCgpGSUVNQVBfRVhURU5U
X0RFTEFMTE9DClRoaXMgd2lsbCBhbHNvIHNldCBGSUVNQVBfRVhURU5UX1VOS05PV04uCgpEZWxh
eWVkIGFsbG9jYXRpb24gLSB3aGlsZSB0aGVyZSBpcyBkYXRhIGZvciB0aGlzIGV4dGVudCwgaXRz
CnBoeXNpY2FsIGxvY2F0aW9uIGhhcyBub3QgYmVlbiBhbGxvY2F0ZWQgeWV0LgoKRklFTUFQX0VY
VEVOVF9VTldSSVRURU4KVW53cml0dGVuIGV4dGVudCAtIHRoZSBleHRlbnQgaXMgYWxsb2NhdGVk
IGJ1dCBpdHMgZGF0YSBoYXMgbm90CmJlZW4gaW5pdGlhbGl6ZWQuIFRoaXMgaW5kaWNhdGVzIHRo
ZSBleHRlbnTigJlzIGRhdGEgd2lsbCBiZSBhbGwKemVybyBpZiByZWFkIHRocm91Z2ggdGhlIGZp
bGVzeXN0ZW0gYnV0IHRoZSBjb250ZW50cyBhcmUgdW5kZWZpbmVkCmlmIHJlYWQgZGlyZWN0bHkg
ZnJvbSB0aGUgZGV2aWNlLgoKWzFdIGh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvZG9jL2h0bWwvbGF0
ZXN0L2ZpbGVzeXN0ZW1zL2ZpZW1hcC5odG1sCgpGSUVNQVBfRVhURU5UX1VOV1JJVFRFTiBtZWFu
cyBibG9jayBhZGRyZXNzIGlzIHByZWFsbG9jYXRlZCwgYnV0IHcvbwpiZWVuIHdyaXR0ZW4gYW55
IGRhdGEsIHdoaWNoIHN0YXR1cyBmMmZzIGlzIG5vdCBzdXBwb3J0ZWQgbm93LCBmb3IgYWxsCk5F
V19BRERSIGJsb2NrIGFkZHJlc3NlcywgaXQgbWVhbnMgZGVsYXkgYWxsb2NhdGVkIGJsb2Nrcywg
c28gbGV0J3MKdGFnIEZJRU1BUF9FWFRFTlRfREVMQUxMT0MgaW5zdGVhZC4KClRlc3RjYXNlOgp4
ZnNfaW8gLWYgLWMgJ3B3cml0ZSAwIDY0aycgL21udC9mMmZzL2ZpbGU7CmZpbGVmcmFnIC12IC9t
bnQvZjJmcy9maWxlCgpPdXRwdXQ6Ci0gQmVmb3JlCkZpbGVzeXN0ZW0gdHlwZSBpczogZjJmNTIw
MTAKRml6ZSBvZiAvbW50L2YyZnMvZmlsZSBpcyA2NTUzNiAoMTYgYmxvY2tzIG9mIDQwOTYgYnl0
ZXMpCiBleHQ6ICAgICBsb2dpY2FsX29mZnNldDogICAgICAgIHBoeXNpY2FsX29mZnNldDogbGVu
Z3RoOiAgIGV4cGVjdGVkOiBmbGFnczoKICAgMDogICAgICAgIDAuLiAgICAgIDE1OiAgICAgICAg
ICAwLi4gICAgICAgIDE1OiAgICAgMTY6ICAgICAgICAgICAgIGxhc3QsdW53cml0dGVuLG1lcmdl
ZCxlb2YKL21udC9mMmZzL2ZpbGU6IDEgZXh0ZW50IGZvdW5kCgotIEFmdGVyOgpGaWxlc3lzdGVt
IHR5cGUgaXM6IGYyZjUyMDEwCkZpbGUgc2l6ZSBvZiAvbW50L2YyZnMvZmlsZSBpcyA2NTUzNiAo
MTYgYmxvY2tzIG9mIDQwOTYgYnl0ZXMpCiBleHQ6ICAgICBsb2dpY2FsX29mZnNldDogICAgICAg
IHBoeXNpY2FsX29mZnNldDogbGVuZ3RoOiAgIGV4cGVjdGVkOiBmbGFnczoKICAgMDogICAgICAg
IDAuLiAgICAgIDE1OiAgICAgICAgICAwLi4gICAgICAgICAwOiAgICAgIDA6ICAgICAgICAgICAg
IGxhc3QsdW5rbm93bl9sb2MsZGVsYWxsb2MsZW9mCi9tbnQvZjJmcy9maWxlOiAxIGV4dGVudCBm
b3VuZAoKRml4ZXM6IDdmNjNlYjc3YWY3YiAoImYyZnM6IHJlcG9ydCB1bndyaXR0ZW4gYXJlYSBp
biBmMmZzX2ZpZW1hcCIpClNpZ25lZC1vZmYtYnk6IENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4K
LS0tCnYyOgotIGZpeCB0eXBlIGFuZCB1cGRhdGUgZGVzY3JpcHRpb24gb2YgZmllbWFwIG1hbnVh
bCBpbiBjb21taXQgbWVzc2FnZS4KIGZzL2YyZnMvZGF0YS5jIHwgNyArKysrKy0tCiAxIGZpbGUg
Y2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Zz
L2YyZnMvZGF0YS5jIGIvZnMvZjJmcy9kYXRhLmMKaW5kZXggMGE1ODMyZWM0MDQ2Li5iZWNjN2Jk
Yjc0MDMgMTAwNjQ0Ci0tLSBhL2ZzL2YyZnMvZGF0YS5jCisrKyBiL2ZzL2YyZnMvZGF0YS5jCkBA
IC0xOTk5LDcgKzE5OTksMTAgQEAgaW50IGYyZnNfZmllbWFwKHN0cnVjdCBpbm9kZSAqaW5vZGUs
IHN0cnVjdCBmaWVtYXBfZXh0ZW50X2luZm8gKmZpZWluZm8sCiAJfQogCiAJaWYgKHNpemUpIHsK
LQkJZmxhZ3MgfD0gRklFTUFQX0VYVEVOVF9NRVJHRUQ7CisJCWlmIChmbGFncyAmIEZJRU1BUF9F
WFRFTlRfREVMQUxMT0MpCisJCQlwaHlzID0gMDsKKwkJZWxzZQorCQkJZmxhZ3MgfD0gRklFTUFQ
X0VYVEVOVF9NRVJHRUQ7CiAJCWlmIChJU19FTkNSWVBURUQoaW5vZGUpKQogCQkJZmxhZ3MgfD0g
RklFTUFQX0VYVEVOVF9EQVRBX0VOQ1JZUFRFRDsKIApAQCAtMjAzOSw3ICsyMDQyLDcgQEAgaW50
IGYyZnNfZmllbWFwKHN0cnVjdCBpbm9kZSAqaW5vZGUsIHN0cnVjdCBmaWVtYXBfZXh0ZW50X2lu
Zm8gKmZpZWluZm8sCiAJCQkJc2l6ZSArPSBibGtzX3RvX2J5dGVzKGlub2RlLCAxKTsKIAkJCX0K
IAkJfSBlbHNlIGlmIChtYXAubV9mbGFncyAmIEYyRlNfTUFQX0RFTEFMTE9DKSB7Ci0JCQlmbGFn
cyA9IEZJRU1BUF9FWFRFTlRfVU5XUklUVEVOOworCQkJZmxhZ3MgPSBGSUVNQVBfRVhURU5UX0RF
TEFMTE9DOwogCQl9CiAKIAkJc3RhcnRfYmxrICs9IGJ5dGVzX3RvX2Jsa3MoaW5vZGUsIHNpemUp
OwotLSAKMi4yNS4xCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlz
dHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xp
c3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
