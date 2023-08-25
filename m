Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3557891CB
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 26 Aug 2023 00:44:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qZfXC-0001Im-3B;
	Fri, 25 Aug 2023 22:44:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <drosen@google.com>) id 1qZfXA-0001Ig-LD
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Aug 2023 22:44:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tK+QJY4E1UOuHvMRNpsQhzdkVC4iiLEwKjXA5J73MNw=; b=Tz1NCbWe+wgJNffQpCmLD0EKz5
 Gw0klUmthwKKKDr6Q09vsbDYI3F6Wibv6caVfBK4qY1mHDI3LlK7QI/dKERWzxwzvsjzVn/iQrAA9
 E9mlS0M8oBBvRzqzaByrXnmFISiX2rKk3b3NBbSCvukIVi+ZM5gdt6R/AILJOrHOEcDY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tK+QJY4E1UOuHvMRNpsQhzdkVC4iiLEwKjXA5J73MNw=; b=Y3AO25cYqDQDtiIVBvCPL3GqEX
 XQEcsePrOcDNeZzxkOAc5NovSsZrUwFuGbaRAi4FHJALRYvJQyvN9yMvxN0o2Awi6e2kl7MNTLH+3
 lsagsvhNLEATS5fqq1Yro06k823INz3AfEY8sxE3d+aPNUwiKn726mxNqyPILPi/f9BQ=;
Received: from mail-wr1-f46.google.com ([209.85.221.46])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qZfX9-0007MU-Rh for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Aug 2023 22:44:04 +0000
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-31c73c21113so1173919f8f.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 25 Aug 2023 15:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1693003437; x=1693608237;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tK+QJY4E1UOuHvMRNpsQhzdkVC4iiLEwKjXA5J73MNw=;
 b=i+9eZsDNtgDkIL8zsBowEXLrzpegPtMbYBvhRsY2Ovtfjzu/vnr+Sqs6uY5nhSNAX2
 BnEPuZhrKl7bVboDAqhrN/wHgGbmDQeOrttgMUP5GR7tuWC3HXL2Vuf2beT1LcNX1/na
 QEEtfanxsJtkrmA1LbK+26mkWLMQ2w6P4GR4g+4Ii+qUpDDcjsvD+F9/7MdLk8VfshOg
 zTNTekgD8JoRYio77a4ns3O95D7sPBvdsCmjeJqd+Wq1PEqP7wuMvBv9TgKWzgmSSprn
 6W6dG2xp2xVmpmEaY1+kDR3pxESqF0xZw+rS9hj+HiSYNCLknsgvUzM7zMK/yJ8Molmr
 c7LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693003437; x=1693608237;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tK+QJY4E1UOuHvMRNpsQhzdkVC4iiLEwKjXA5J73MNw=;
 b=HhqnufjBsCm/gDqcN0sUl9Nc6x9juwnUykmxeclKYi1KVikxMHFXTWbf84hnm8QTiI
 EHlHmUS/UhRjtWtFzIm18uE1d0mTNp3abjWWjGFxAoslDC/Bw7RAjY2RiQAIlj+yRAyE
 x3hqMMXCk+fEJ4+Qi6ajxFcTQQZEqkJ+s1ZSjFbWWCuw9fPxk6GsN1UxKI0hq37dg40o
 X/zbZkGmGodVwutAmw6BEQAVYvJ19JMLCzP+sHlbdrMpzhDoQJi5Ztvdt99oJFSxF8hG
 OSIJa90HN6XsU6h5hLhR9lVVGbP3/aYAgD4KYv+esb6YEkVx1qn+GR2C+lLWKZxi24JV
 Tq/A==
X-Gm-Message-State: AOJu0YxW4FpzFiDMUpesEwQuF6lo53g6NiF4NJzuH//+zU9adNrXVe3u
 jtzYoPPM6+a4uDU+/jZL9qsQI99bTXsn7Gz/Dc2yYw==
X-Google-Smtp-Source: AGHT+IGM5nMsNEZzwWfqGfbC1twOzJR5q+MO9OPCU+Stp11bTMyS37OJlIO8+GjEyqAt/bOZ8JFjwBc+YNX3u1kvcvk=
X-Received: by 2002:adf:b613:0:b0:31c:81ef:f90a with SMTP id
 f19-20020adfb613000000b0031c81eff90amr1868722wre.47.1693003437251; Fri, 25
 Aug 2023 15:43:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230816011359.1964484-1-drosen@google.com>
 <20230816011359.1964484-2-drosen@google.com>
 <ZOjnXflReKGKgI+E@google.com>
In-Reply-To: <ZOjnXflReKGKgI+E@google.com>
Date: Fri, 25 Aug 2023 15:43:46 -0700
Message-ID: <CA+PiJmS5DMz-7U6kKZKvGbMcnxhwCs+aKRs5SjeFoE5vJckTmQ@mail.gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: -15.7 (---------------)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Fri, Aug 25, 2023 at 10:39 AM Jaegeuk Kim <jaegeuk@kernel.org>
    wrote: > > Hi Daniel, > > f2fs_format_main.c: In function ‘add_default_options’:
    > f2fs_format_main.c:142:41: error: ‘struct f [...] 
 
 Content analysis details:   (-15.7 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.221.46 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.221.46 listed in wl.mailspike.net]
 -7.5 USER_IN_DEF_SPF_WL     From: address is in the default SPF
                             welcome-list
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM
                             welcome-list
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.5 ENV_AND_HDR_SPF_MATCH  Env and Hdr From used in default SPF WL
                             Match
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1qZfX9-0007MU-Rh
Subject: Re: [f2fs-dev] [PATCH 1/7] f2fs-tools: Define constants in terms of
 BLKSIZE
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
From: Daniel Rosenberg via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Daniel Rosenberg <drosen@google.com>
Cc: kernel-team@android.com, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gRnJpLCBBdWcgMjUsIDIwMjMgYXQgMTA6MznigK9BTSBKYWVnZXVrIEtpbSA8amFlZ2V1a0Br
ZXJuZWwub3JnPiB3cm90ZToKPgo+IEhpIERhbmllbCwKPgo+IGYyZnNfZm9ybWF0X21haW4uYzog
SW4gZnVuY3Rpb24g4oCYYWRkX2RlZmF1bHRfb3B0aW9uc+KAmToKPiBmMmZzX2Zvcm1hdF9tYWlu
LmM6MTQyOjQxOiBlcnJvcjog4oCYc3RydWN0IGYyZnNfY29uZmlndXJhdGlvbuKAmSBoYXMgbm8g
bWVtYmVyIG5hbWVkIOKAmGJsa3NpemXigJkKPiAgIDE0MiB8ICAgICAgICAgICAgICAgICBjLndh
bnRlZF9zZWN0b3Jfc2l6ZSA9IGMuYmxrc2l6ZTsKPiAgICAgICB8ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBeCj4gbWFrZVsyXTogKioqIFtNYWtlZmlsZTo1MTY6IGYy
ZnNfZm9ybWF0X21haW4ub10gRXJyb3IgMQo+IG1ha2VbMl06ICoqKiBXYWl0aW5nIGZvciB1bmZp
bmlzaGVkIGpvYnMuLi4uCj4gZjJmc19mb3JtYXRfbWFpbi5jOiBJbiBmdW5jdGlvbiAnYWRkX2Rl
ZmF1bHRfb3B0aW9ucyc6Cj4gZjJmc19mb3JtYXRfbWFpbi5jOjE0Mjo0MTogZXJyb3I6ICdzdHJ1
Y3QgZjJmc19jb25maWd1cmF0aW9uJyBoYXMgbm8gbWVtYmVyIG5hbWVkICdibGtzaXplJwo+ICAg
MTQyIHwgICAgICAgICAgICAgICAgIGMud2FudGVkX3NlY3Rvcl9zaXplID0gYy5ibGtzaXplOwo+
ICAgICAgIHwKPgoKT29mLi4uIE1pc3NlZCB1cGRhdGluZyB0aGUgcGF0Y2ggZmlsZXMgYWZ0ZXIg
bXkgbGFzdCByZWJhc2UuIEknbGwKcmVzZW5kLiBUb29rIHRoZSBvcHBvcnR1bml0eSB0byBtb3Zl
IHNvbWUgY2hhbmdlcyBpbiB0aGUgbGFzdCBwYXRjaCB1cAp0byB0aGUgZmlyc3QgYXMgd2VsbC4K
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1m
MmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdl
Lm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1m
MmZzLWRldmVsCg==
