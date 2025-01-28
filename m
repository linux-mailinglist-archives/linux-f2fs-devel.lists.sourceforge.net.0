Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 58195A214B5
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 29 Jan 2025 00:00:02 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tcuYi-0005JC-D7;
	Tue, 28 Jan 2025 22:59:53 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <corbet@lwn.net>) id 1tcuYh-0005J2-9V
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 28 Jan 2025 22:59:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+meNH1juZBBtvrp/xo2cF0Sh2lEGZRx9Dv3JEMGVfwQ=; b=VtA/s+U1UmiCPoASXHqNZlobNE
 v7n09mQkBxmdI15vT66cuNBI+4THesZtfeyIMHsVF36tV+opmpgj5SSHbJigeLrZSiMT6M6kNUxl+
 vVBdv5T24W5hmoO6FDH1TtWz8Dpro/lNJL51irWK+N+ar8b5fQbQ+/36Gk79LAviX/KE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+meNH1juZBBtvrp/xo2cF0Sh2lEGZRx9Dv3JEMGVfwQ=; b=aqbAelB6tgjw8p6wjTndTt1mXM
 ys/AZssjFTrRJHdUZLV1Ck2a6xmRavxSHT6jQfMA0I/0VCPaFDxMpLls7bPOFSXxzNiwv/Jvbmrni
 rHpEk9WFZIIZwOY+YP+szGN+O3qyiLMgAlHFsLaSHJ8efDoPSEmB9LrwyPKoaq064jps=;
Received: from ms.lwn.net ([45.79.88.28])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tcuYh-0001cE-7j for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 28 Jan 2025 22:59:51 +0000
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 06ECA403FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
 t=1738104121; bh=+meNH1juZBBtvrp/xo2cF0Sh2lEGZRx9Dv3JEMGVfwQ=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=NUNSUUGtYAw8IZ7v+u9urKWTHqRqgIaFDi/LwOklT1yZ+dVdXczOD9aTVo9dL8GaQ
 OAf5s35W/sLcrCXBP9L1rzztGXQrZf82Io4oQsEPVhxr2Gmfam9dfHpeHYHM4gAzS8
 Z5wJvtiQGdryhtYMX/RqM8UUTkxsZ7qqsI/DxEU04UzFD7wrLVaAgpDF9YgOAVZODR
 ghFfoDDu31L5plmrTy4y8+t+6MkL5TJscft0G5BNRz45gjvAU7I+oGLILjgoaHhU9M
 9iNee1I8iwhHjJ3JhYnCMWXNAtQ6QziZH5AMs5lTvSyDYyN1vQVIIWC4TLGwjRIBKs
 EZQClEOOCB0lQ==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id 06ECA403FA;
 Tue, 28 Jan 2025 22:42:00 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Linux Doc Mailing
 List <linux-doc@vger.kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
In-Reply-To: <cover.1738020236.git.mchehab+huawei@kernel.org>
References: <cover.1738020236.git.mchehab+huawei@kernel.org>
Date: Tue, 28 Jan 2025 15:42:00 -0700
Message-ID: <87h65i7e87.fsf@trenco.lwn.net>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
 > Hi Jon/Greg,
 > > That's the second version of my RFC patches meant to modenize
 the ABI > parser that I wrote in Perl. I have a couple of minor comments
 on the individual patches, but overall I do like this direction. 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [45.79.88.28 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [45.79.88.28 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [45.79.88.28 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1tcuYh-0001cE-7j
Subject: Re: [f2fs-dev] [RFC v2 00/38] Improve ABI documentation generation
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
Cc: linux-pm@vger.kernel.org, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 netdev@vger.kernel.org, coresight@lists.linaro.org, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-hardening@vger.kernel.org,
 workflows@vger.kernel.org, bpf@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> Hi Jon/Greg,
>
> That's the second version of my RFC patches meant to modenize the ABI
> parser that I wrote in Perl.

I have a couple of minor comments on the individual patches, but overall
I do like this direction.

It would be nice, though, if the code were a bit more extensively
commented.  Parts of it get into the "twistly maze of regexes" mode that
can be awfully hard to follow.

> On this series we have:
>
> patches 1 to 11: several bug fixes addressing issues at ABI symbols;

1-3 aren't needed - it seems you already upstreamed #2?

For the rest, is there any reason to not apply them right away?  They
just seem like worthwhile fixes.

> patch 12: a fix for scripts/documentation-file-ref-check
> patches 13-15: create new script with rest and search logic and 
>   minimally integrate with kernel_abi Sphinx extension(phase 1);
> patches 16-19: implement phase 2: class integration (phase 2);
> patch 20: fix a bug at kernel_abi: the way it splits lines is buggy;
> patches  21-24: rewrite kernel_abi logic to make it simpler and more
>   robust;
> patches 25-27: add cross-reference support at automarkup;
> patches 28-36: several ABI cleanups to cope with the improvements;
> patch 37: implement undefined command;
> patch 38: get rid of the old Perl script.
>
> To make it easier to review/apply, I may end breaking the next version
> on a couple of different patchsets. Still it would be nice to have more
> people testing it and providing some feedback.

I've looked over everything, though with limited depth.  My testing
hasn't turned up any problems.  I've only tested with current Sphinx,
have you tried this with the more ancient versions we support?

[It's probably time to raise our minimum version again, especially now
that current Sphinx has better performance.]

I don't see a whole lot of reasons not to apply this set shortly after
the merge window; anybody disagree?

Thanks,

jon


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
