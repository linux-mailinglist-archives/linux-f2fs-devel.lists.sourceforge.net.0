Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F62A7F459
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Apr 2025 07:44:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u21l0-0001MQ-OL;
	Tue, 08 Apr 2025 05:44:22 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1u21kz-0001MK-8z
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Apr 2025 05:44:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=n9ccMdN+ldyiAdk/WQs8niTPmp1ZJ2cUEXeqWZPe0FE=; b=lhqum8dPeddxhCGUjZLyGmOPOB
 0yET69V6Wdja3Woy0G5oVMOsE7l88F87BFWFsGTQSWdFXpItGugA3s+wQMsG6bUGjS5Ue8LvfSiMN
 jgc+UqouLG6eiMNGdzcNi7vXW2f72IS5SJf95xz827c/Um7u/J2D5DPGkfUQJldw9Gag=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=n9ccMdN+ldyiAdk/WQs8niTPmp1ZJ2cUEXeqWZPe0FE=; b=Rd0dPYflN7rv8fEEnG1jzos5YA
 veubVyN3rddMDZIlTZvjtw99DuBasLixnSHT83bl7mraPswrfqUezLZo9WqDkfUzbpTBUC1xW7GUa
 KPxzGT+AtiKuGAElJlJF+yyxysO+46b8QIXp0MQq86Ar51R2zkP6TpzIc7MNbS1CXj7g=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1u21ki-00043c-W3 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Apr 2025 05:44:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7739C5C582E;
 Tue,  8 Apr 2025 05:41:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9475EC4CEE5;
 Tue,  8 Apr 2025 05:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744091034;
 bh=9e8hhapUpzC3ELsU8O8aolAXA4ijNopU8Cq5QpLCc9M=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=cewDUu3M5zAioX7t3/se165XF5X29DPVahyIRkseudN2XqH3M7+DiWhw99Gg/XPyU
 bHJuuZgmzQvGOH55hhQqrKrwgClPtlNZdHngpm5DSn9+RkV5Voss/4C9cAW6kH1MQl
 K7QC6vNtZN45L9HXx1hz6hRfwDK/23U8XX1NXi7xCkmKsaJpmd2c64w8D7ADtbGDru
 sVoiQeOqU24GrR7TkMuFL/opxpq+rE1MvTz1Z3aPJaVwrYemTpOW4Jf0PO6gPzZH39
 fphdgqO7pNoxrF2JgTjAqaIahY3Il7h4MwvLehVZ4TAU02UhiK0/7SNfAs7be5XLbW
 HA0Jn0Us9V4xA==
Message-ID: <e47d4582-60fe-4e55-acfd-d7a10737fa40@kernel.org>
Date: Tue, 8 Apr 2025 13:43:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: uplinkr@airmail.cc, linux-f2fs-devel@lists.sourceforge.net
References: <88f281ff9ff9b1fb899c92d6b32f52b7@airmail.cc>
Content-Language: en-US
In-Reply-To: <88f281ff9ff9b1fb899c92d6b32f52b7@airmail.cc>
X-Spam-Score: -5.5 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 4/6/25 16:04, uplinkr--- via Linux-f2fs-devel wrote: >
 Hello everyone, > > I am having trouble with F2FS. Specifically, I believe
 metadata got corrupted when I resized it. I have a 512 GB drive. My [...]
 Content analysis details:   (-5.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1u21ki-00043c-W3
Subject: Re: [f2fs-dev] Resize metadata corruption
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gNC82LzI1IDE2OjA0LCB1cGxpbmtyLS0tIHZpYSBMaW51eC1mMmZzLWRldmVsIHdyb3RlOgo+
IEhlbGxvIGV2ZXJ5b25lLAo+IAo+IEkgYW0gaGF2aW5nIHRyb3VibGUgd2l0aCBGMkZTLiBTcGVj
aWZpY2FsbHksIEkgYmVsaWV2ZSBtZXRhZGF0YSBnb3QgY29ycnVwdGVkIHdoZW4gSSByZXNpemVk
IGl0LiBJIGhhdmUgYSA1MTIgR0IgZHJpdmUuIE15IEYyRlMgcGFydGl0aW9uIHdhcyBhcHByb3hp
bWF0ZWx5IGxvY2F0ZWQgb24gMzY5LTQ5NyBHQiAoMTI4IEdCIHNpemUpLiBVc2luZwo+IEdQYXJ0
ZWQsIEkgcmVzaXplZCBpdCB0byAwLjUtNDk3IEdCLiBXaGlsZSB0aGUgcGFydGl0aW9uIHJlc2l6
aW5nIHdlbnQgdGhyb3VnaCBzdWNjZXNzZnVsbHksIGZpbGVzeXN0ZW0gcmVzaXppbmcgaW5pdGlh
bGx5IGZhaWxlZCB3aXRoICJNb3VudCB1bmNsZWFuIGltYWdlIHRvIHJlcGxheSBsb2ciLiBJIGhh
dmUgZG9uZSB0aGF0IGFuZCByZXRyaWVkCj4gcmVzaXppbmcuCj4gCj4gQWZ0ZXJ3YXJkcywgaG93
ZXZlciwgZnNjayBzdGFydGVkIGdpdmluZyBvdXQgYSBsb3Qgb2YgZXJyb3JzLCBhdCBvbmUgcG9p
bnQgaXQgYXNrZWQgaWYgSSB3aXNoZWQgdG8gcmVzdG9yZSBsb3N0IGRhdGEsIHdoaWNoIEkgYWdy
ZWVkIHRvLiBMb2dzIHNwZWNpZmllZCBhIGxvdCBvZiBteSBmaWxlcyAod2hpY2ggSSBjb3VsZCB0
ZWxsIGJ5Cj4gZmlsZW5hbWVzKSBhbmQgbWlkLXdheSB0aHJvdWdoIHRoZSBwcm9jZXNzLCBpdCBz
ZWdmYXVsdGVkLiBOb3csIHdoZW4gSSBydW4gZnNjaywgbm8gZmlsZXMgYXJlIGFza2VkIHRvIGJl
IHJlc3RvcmVkLCBhbmQgaXQgY29tcGxldGVzIHN1Y2Nlc3NmdWxseS4gSG93ZXZlciwgd2hlbiBJ
IGF0dGVtcHQgdG8gbW91bnQgaXQsIEkgZ2V0IGFuIGVycm9yCj4gc2F5aW5nICJTdHJ1Y3R1cmUg
bmVlZHMgY2xlYW5pbmciLgo+IAo+IENvdWxkIHNvbWVvbmUgaGVscCBtZSByZXN0b3JlIG15IG1l
dGFkYXRhIChhdCBsZWFzdCwgbG9uZyBlbm91Z2ggdG8gZXh0cmFjdCBteSBmaWxlcyk/IFRoYW5r
cy4KPiAKPiBkbWVzZyBsb2dzOgo+IAo+IFvCoMKgIDk2LjE4NDEyN10gRjJGUy1mcyAobnZtZTBu
MXA1KTogTWlzbWF0Y2ggdmFsaWQgYmxvY2tzIDc2OSB2cy4gNjgKPiBbwqDCoCA5Ni4xODgwNTBd
IEYyRlMtZnMgKG52bWUwbjFwNSk6IEZhaWxlZCB0byBpbml0aWFsaXplIEYyRlMgc2VnbWVudCBt
YW5hZ2VyICgtMTE3KQo+IAo+IGZzY2suZjJmcyAtLWRyeS1ydW4gLWQgMyBsb2dzOiBodHRwczov
L2FydGVyLmNvbS8uZjJmcy0yMDI1MDQwNi9mc2NrLmxvZwoKSGVsbG8sCgpDb3VsZCB5b3UgcGxl
YXNlIHVwbG9hZCBmc2NrLmxvZyBpbiBidWd6aWxsYS5rZXJuZWwub3JnLCBvciBzb21ld2hlcmUg
ZWxzZT8KSSBjYW4gbm90IGRvd25sb2FkIGl0IGZyb20gYWJvdmUgbGluayBhZGRyZXNzLCBzb3Jy
eS4KClRoYW5rcywKCj4gCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KPiBMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdAo+IExpbnV4LWYyZnMt
ZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cj4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5u
ZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAoKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlz
dApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNv
dXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
