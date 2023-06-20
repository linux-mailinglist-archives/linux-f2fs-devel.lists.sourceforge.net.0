Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE2A736568
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Jun 2023 09:55:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qBWCq-0005ja-Dp;
	Tue, 20 Jun 2023 07:55:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1qBWCe-0005jS-5T
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Jun 2023 07:55:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ggfqpg2T6UtHaQ9JI9PXzNWeKnYQrdGsPter6PmcuJ8=; b=QQQKzI55XHqifySOKjxT/Xewly
 x5PnG4NeuMl+OJnhNXG9FfvuD4GLRX8DNOIplYFR0jRtpcsWO4kc53R6r0BqzR984i/ubrxJu1mQu
 RdNO8C9Yvj2CROknZ8m9BZKPTj2XgDBFi2m3EtjqIkSsws1+7nmsSaY2Swq1RAXBSM2o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ggfqpg2T6UtHaQ9JI9PXzNWeKnYQrdGsPter6PmcuJ8=; b=Q6Xlgj3JWsev3wOoXntIw+bMx1
 TbTMS+eXzo9nRN7e5UwYsJANDonP5xiZ+SimMApJM33jrYnmaNQAKCIVLfgEfZvkua7w1681vj7cP
 S2+c0OLpnjLT10qXwkbF1XibMTbRa2Vqg5KV8nL3OqDqb7fpiQLYLSdjRUBhXII975rw=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qBWCd-009P7t-Sh for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Jun 2023 07:55:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7A18061027;
 Tue, 20 Jun 2023 07:54:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 017D7C433C0;
 Tue, 20 Jun 2023 07:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1687247697;
 bh=sTQUsMU4v3FUIkGlINnBHSs6rd3VGMrSfXMTLhs40+s=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=JuxQMmRIkMUYXmq93mDvU+ISUN6Z5DeSxGGAdHYklBezpATnyIWlA91w021ytW6Dm
 zNQBBtkH+Oz8NgyOAMV4L6Lq1XVmIQH0/SsDBj7hGCrPHWIzL6zQWYiSMhZjUc3lVS
 jlmYduvpI9+trGB5plj26kjZRu8yAmomLYG/8cZhegqxZrlq05jMQ361JEm1vKTTDA
 EzjXJkzLdu/rhFHzrMB13KdRcLFPS4clnIdHCDmEBlDCsub843LSDPisinUEsSS82e
 tTGxYl+8luutKJEt0JdEzvZSL0VTTx1LNtY+jK1RBcctdDgwFFWAU0lSORr1vuezT8
 CmqDI97655yuw==
Message-ID: <f7a44e66-6fde-a178-d29e-7684bcbc454e@kernel.org>
Date: Tue, 20 Jun 2023 15:54:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Content-Language: en-US
To: =?UTF-8?B?5L2V5LqR6JW+KFl1bmxlaSBoZSk=?= <heyunlei@oppo.com>,
 jaegeuk@kernel.org
References: <20230613085250.3648491-1-heyunlei@oppo.com>
 <b8523d41-246b-b11e-f6e3-423e32cc597a@kernel.org>
 <6c527e97-c4a6-dc58-13fb-516f77e5e068@oppo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <6c527e97-c4a6-dc58-13fb-516f77e5e068@oppo.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2023/6/20 10:42, 何云蕾(Yunlei he) wrote: > > On 2023/6/20
    8:33, Chao Yu wrote: >> On 2023/6/13 16:52, Yunlei He wrote: >>> File set
    both cold and hot advise bit is confusion, so >>> return EINV [...] 
 
 Content analysis details:   (-5.3 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qBWCd-009P7t-Sh
Subject: Re: [f2fs-dev] [PATCH] f2fs: not allowed to set file both cold and
 hot
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

T24gMjAyMy82LzIwIDEwOjQyLCDkvZXkupHolb4oWXVubGVpIGhlKSB3cm90ZToKPiAKPiBPbiAy
MDIzLzYvMjAgODozMywgQ2hhbyBZdSB3cm90ZToKPj4gT24gMjAyMy82LzEzIDE2OjUyLCBZdW5s
ZWkgSGUgd3JvdGU6Cj4+PiBGaWxlIHNldCBib3RoIGNvbGQgYW5kIGhvdCBhZHZpc2UgYml0IGlz
IGNvbmZ1c2lvbiwgc28KPj4+IHJldHVybiBFSU5WQUwgdG8gYXZvaWQgdGhpcyBjYXNlLgo+Pj4K
Pj4+IFNpZ25lZC1vZmYtYnk6IFl1bmxlaSBIZSA8aGV5dW5sZWlAb3Bwby5jb20+Cj4+PiAtLS0K
Pj4+IMKgIGZzL2YyZnMveGF0dHIuYyB8IDMgKysrCj4+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMyBp
bnNlcnRpb25zKCspCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMveGF0dHIuYyBiL2ZzL2Yy
ZnMveGF0dHIuYwo+Pj4gaW5kZXggMjEzODA1ZDM1OTJjLi45MTdmM2FjOWYxYTEgMTAwNjQ0Cj4+
PiAtLS0gYS9mcy9mMmZzL3hhdHRyLmMKPj4+ICsrKyBiL2ZzL2YyZnMveGF0dHIuYwo+Pj4gQEAg
LTEyNyw2ICsxMjcsOSBAQCBzdGF0aWMgaW50IGYyZnNfeGF0dHJfYWR2aXNlX3NldChjb25zdCBz
dHJ1Y3QgeGF0dHJfaGFuZGxlciAqaGFuZGxlciwKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHJldHVybiAtRUlOVkFMOwo+Pj4KPj4+IMKgwqDCoMKgwqDCoMKgwqAgbmV3X2Fk
dmlzZSA9IG5ld19hZHZpc2UgJiBGQURWSVNFX01PRElGSUFCTEVfQklUUzsKPj4+ICvCoMKgwqDC
oMKgwqAgaWYgKChuZXdfYWR2aXNlICYgRkFEVklTRV9DT0xEX0JJVCkgJiYgKG5ld19hZHZpc2Ug
JiBGQURWSVNFX0hPVF9CSVQpKQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0
dXJuIC1FSU5WQUw7Cj4+Cj4+IFl1bmxlaSwKPj4KPj4gV2hhdCBhYm91dCB0aGUgYmVsb3cgY2Fz
ZToKPj4KPj4gMS4gZjJmc194YXR0cl9hZHZpc2Vfc2V0KEZBRFZJU0VfQ09MRF9CSVQpCj4+IDIu
IGYyZnNfeGF0dHJfYWR2aXNlX3NldChGQURWSVNFX0hPVF9CSVQpCj4gCj4gSGkswqAgQ2hhbywK
PiAKPiAgwqDCoMKgIEkgdGVzdCB0aGlzIGNhc2Ugd29yayB3ZWxsIHdpdGggdGhpcyBwYXRjaCzC
oCBjYXNlIGJlbG93IHdpbGwgcmV0dXJuIC1FSU5WQUw6Cj4gCj4gIMKgwqDCoCBmMmZzX3hhdHRy
X2FkdmlzZV9zZXQoRkFEVklTRV9DT0xEX0JJVCB8IEZBRFZJU0VfSE9UX0JJVCkKCkNvcnJlY3Qs
IEkgbWlzc2VkIHRvIGNoZWNrIGJlbG93IHN0YXRlbWVudC4KCm5ld19hZHZpc2UgfD0gb2xkX2Fk
dmlzZSAmIH5GQURWSVNFX01PRElGSUFCTEVfQklUUzsKCkFueXdheSwgdGhlIHBhdGNoIGxvb2tz
IGdvb2QgdG8gbWUuCgpSZXZpZXdlZC1ieTogQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPgoKVGhh
bmtzLAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNl
Zm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xp
bnV4LWYyZnMtZGV2ZWwK
