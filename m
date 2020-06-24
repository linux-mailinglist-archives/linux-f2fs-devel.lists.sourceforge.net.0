Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 23EF1206C20
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Jun 2020 08:04:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jnyW5-00015n-FR; Wed, 24 Jun 2020 06:04:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jnyW3-00015f-V6
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 24 Jun 2020 06:04:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+d9GiKN34fRRDo0wEbPZEKkcvPO1+U3THTvcbnSop94=; b=d4HjeBXels7onN/Hfjhe55UPjl
 k8okyHjrFOk+jUFGoTlxw+XIX7BIKxFbNNNoa8OtMwXbSM0joGXEem9rHjhfMtZI1vNu7mmlX/i+k
 njm/aJcO2cTlgfiT4n1517oDCxBoZrjSfHEd+Smz4I81kpfDcGXYKsNRqmMkgsuS7j2o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+d9GiKN34fRRDo0wEbPZEKkcvPO1+U3THTvcbnSop94=; b=dhzKwq7WZwLehKZKh0Cs19cAbz
 pKDrccpzqQB61qKlVWVAUQrLBHpRa31BNJjP1JCYYHYx9vKH+7GD8akskNR1oBxnwGYzjGsto91Yr
 X66MoWANgWq7S47AIFJB5KdIP3wjkaEU1QI+1p5MWEpxNUnGKglfcLv/s5Q7tPQA2InY=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jnyW2-00GjDS-U0
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 24 Jun 2020 06:04:11 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 11AC92085B;
 Wed, 24 Jun 2020 06:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592978645;
 bh=STmnuLbp6dqBamgAzJ+Ue/+bNkc6g/1tpfJs2y+gU6M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=po3bfXB92hJ+PijyLMwHXbS/arxBw/0IUAsnaYskimBhp5qtvm5z+v8pGM+WgW9eW
 FLe98JcBQR5dGhNpYT2AcM037Hpb1EdSMM5PBYfhnf2Wgpw7k7/8mYfd7JPRk5E8No
 teVgpd0E/A1IgM2mFReeceA8sMDJhn8YuudMvMdA=
Date: Tue, 23 Jun 2020 23:04:03 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Daniel Rosenberg <drosen@google.com>
Message-ID: <20200624060403.GH844@sol.localdomain>
References: <20200624043341.33364-1-drosen@google.com>
 <20200624043341.33364-5-drosen@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200624043341.33364-5-drosen@google.com>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jnyW2-00GjDS-U0
Subject: Re: [f2fs-dev] [PATCH v9 4/4] ext4: Use generic casefolding support
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
Cc: kernel-team@android.com, Theodore Ts'o <tytso@mit.edu>,
 Jonathan Corbet <corbet@lwn.net>, Richard Weinberger <richard@nod.at>,
 Andreas Dilger <adilger.kernel@dilger.ca>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, linux-mtd@lists.infradead.org,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Jun 23, 2020 at 09:33:41PM -0700, Daniel Rosenberg wrote:
> This switches ext4 over to the generic support provided in
> commit 5f829feca774 ("fs: Add standard casefolding support")

Commit IDs aren't determined until the patches are applied.  It's possible for
the person applying the patches to fix them, but in general people will forget,
so it's better not to include non-stable commit IDs.

Also, a sentence explaining *why* this change is good would be helpful.
Commit messages should always have a *why* unless it's obvious.

Likewise for the f2fs commit.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
