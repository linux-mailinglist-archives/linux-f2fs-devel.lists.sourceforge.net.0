Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F29CD10391
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 Jan 2026 02:04:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xKQITtXND9ev2XX2rzkh50XCgMLmfXAdx5g/ag8uqv0=; b=U8/DbFa5a8dtUh/o5qGMzJWc8Q
	AiNyjSVOHQVZe5umXaCNSfrhvVYzPN9d7SUSVg28kv+7YkXZoDjwmGy3uA6q6K8tHbqF8se4Qh8iv
	eIMWBBF4qokcepU/NepN+LD8yNldMnmyJGl1WtMMdlC06WoFFXWkKtlYKO/8MJwjXEc8=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vf6Lf-00056Q-Hf;
	Mon, 12 Jan 2026 01:04:00 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vf6Ld-00053Q-8S
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Jan 2026 01:03:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ibhGR9+frTchCbZkvAU0XG/+s3L8AMWTRxOdFdwWC5c=; b=GMgTZ3KsS7hEY9Kic5sDrO//x0
 9m8BcGhbLp6oRnjbzlEESAGbGQe6ElYsGwZrV+maG0abiEvKoxVNYg0TW/CDeZB6wbKMmwXdc3T4m
 3ACH/vGdoFAooSIsKKIfpVOMgT+beuy79vzi5bCuUayEOBBXBlm/KTWOFzkd4onARhXk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ibhGR9+frTchCbZkvAU0XG/+s3L8AMWTRxOdFdwWC5c=; b=kRNGx17f1xh4um0Ul8i4zSMaK/
 iUdVZRswEnYRCYw5ydH0Qt8+15mYkyywbinfBDm0v0SAmmknxKLriC3rzWahScHBVJE+2BGh1WYWs
 I+RNFBMOvtLOG8uIktyUSm1q7HgVAgnGOUuA28zNmkTr0F1Qjrs5c55pAM3vDqNr3SME=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vf6Kw-0007ua-LS for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Jan 2026 01:03:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id F29A660197;
 Mon, 12 Jan 2026 01:03:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABAAAC4CEF7;
 Mon, 12 Jan 2026 01:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768179783;
 bh=31M5baKvnKcs8ZfP2eQXS6/Foy0grzlRmN5hR/hBPiE=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=X8nUe/SfvweawAdrtmOrdwoGWIRWf4jBElenHv6kevPssljudINUVi60LkPgv15ZV
 cj4I4DgX7QlAH1Qd9Du64i0EIfU4f/GozLvZ8JPFXnPQvzYHWQgbPFB9VqxOb6/uzr
 GYtoiAMZ8Xq1HpTojURx0L0Ftx7snI1MPlGZMXisZPq0Oa338icCebxsd7DCXPnoo7
 /q9jNNT6bwm6fBLJ/vMkjBsd9cneisnaolor7G5biej54Pnws6bNet7VpZ6upN+IqX
 xboFjFZKuobW9oHKPxSSHX+f09ESkiSrVomQywWDRDQXFs8E95LnmB2ChnjjTt6PUK
 VsXXgrBIT44jQ==
Message-ID: <a1e52b25-ca95-4698-b36d-c67b65a227c9@kernel.org>
Date: Mon, 12 Jan 2026 09:03:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Nanzhe Zhao <nzzhao@126.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org
References: <20260111100941.119765-1-nzzhao@126.com>
 <20260111100941.119765-3-nzzhao@126.com>
Content-Language: en-US
In-Reply-To: <20260111100941.119765-3-nzzhao@126.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 1/11/2026 6:09 PM,
 Nanzhe Zhao wrote: > In f2fs_read_data_large_folio(), 
 the block zeroing path calls > folio_zero_range() and then continues the
 loop. However, it fails to > advance index and offs [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vf6Kw-0007ua-LS
Subject: Re: [f2fs-dev] [PATCH v2 2/2] f2fs: advance index and offset after
 zeroing in large folio read
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 1/11/2026 6:09 PM, Nanzhe Zhao wrote:
> In f2fs_read_data_large_folio(), the block zeroing path calls
> folio_zero_range() and then continues the loop. However, it fails to
> advance index and offset before continuing.
> 
> This can cause the loop to repeatedly process the same subpage of the
> folio, leading to stalls/hangs and incorrect progress when reading large
> folios with holes/zeroed blocks.
> 
> Fix it by advancing index and offset unconditionally in the loop
> iteration, so they are updated even when the zeroing path continues.
> 
> Signed-off-by: Nanzhe Zhao <nzzhao@126.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
