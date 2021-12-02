Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 935E3465C57
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  2 Dec 2021 03:59:32 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mscJn-0002xA-2l; Thu, 02 Dec 2021 02:59:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1mscJl-0002x4-Tj
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 02 Dec 2021 02:59:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=12rwr1wm19o7jA+E7NLtt22GE1AYt15z2pOzbYXr/lk=; b=TfZMda2yVmxOaon0vwqlutxzve
 jaIySXgA1GCbPDuXgagxgqjo0Jc7awP55LdZ3UfnS17yt6pa/FCLqVxEE6s4KTZe3tVKpe+sFZaK0
 YyW7+JehK1abl7PHm+F7fNYSlAaBbMH6sgHZd8TM3++kBJNm2wm9mRVuZfpBOPutduDw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=12rwr1wm19o7jA+E7NLtt22GE1AYt15z2pOzbYXr/lk=; b=MacND/GkOq09oAMQijxwbEp3p7
 n/ryXR6fLzTkYojf1Q9faRRQXakBvXhSN+X/02JKkLP25usT/0NOihpAhyh3qa/Q2tYmgYd/FrbYB
 Uyonk7nhAPpiCFzssvbaKoscGhFT/vK+k2zRMTs/rZzhws9m48dFWfWsfEAMu/Wo5XSo=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mscJl-0004vJ-6V
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 02 Dec 2021 02:59:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 39AC6CE2160;
 Thu,  2 Dec 2021 02:59:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84B63C00446;
 Thu,  2 Dec 2021 02:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638413952;
 bh=o0NFyjVR2qKGQkr94mZhlpfOuhwPuvNP637P3gi6/8k=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=AkzX99sR2ycBPpq7wWlIq9cDgb+id32l/orV1UQ9u0VYVAblCC7iq6oBxGBUZOHFC
 RXjVvOlysLlZMSZxThtoAKtJSufGY08tqC9CUCaY3nRdddGP7gedC9FN1Y0WYsCMPs
 DMeoYFyhKoM0p6rvNhIEBdG54s7nbJwu6wMbuU3sIKG/x4OYn7Un9X6PHiOn/goBql
 KPsa99t3/8XT5k44jycEiF9nnbNd2YJ3CHxGST0hHSrkg+3PZ7Oy4N58PCaR6ipoR7
 9a36ELos2HfNh7dorqVR5TJ0Oz4/JaCHBldJHFElLLOCxl8YutISculzg/C5gDXGzY
 AG4AYboRhqz0g==
Message-ID: <f1c6e1f5-e2c7-a704-9a3d-5012ba3e9be2@kernel.org>
Date: Thu, 2 Dec 2021 10:59:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20211116214510.2934905-1-jaegeuk@kernel.org>
 <20211116214510.2934905-4-jaegeuk@kernel.org>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20211116214510.2934905-4-jaegeuk@kernel.org>
X-Spam-Score: -2.9 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2021/11/17 5:45, Jaegeuk Kim wrote: > From: Eric Biggers
 <ebiggers@google.com> > > Pass in the original position and count rather
 than the position and > count that were updated by the write. Also [...] 
 Content analysis details:   (-2.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mscJl-0004vJ-6V
Subject: Re: [f2fs-dev] [PATCH 4/6] f2fs: fix the f2fs_file_write_iter
 tracepoint
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
Cc: Eric Biggers <ebiggers@google.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/11/17 5:45, Jaegeuk Kim wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Pass in the original position and count rather than the position and
> count that were updated by the write.  Also use the correct types for
> all arguments, in particular the file offset which was being truncated
> to 32 bits on 32-bit platforms.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
