Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CCCEDF6BC
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 21 Oct 2019 22:28:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iMeI2-0003V3-17; Mon, 21 Oct 2019 20:28:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1iMeHz-0003Uu-7l
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 21 Oct 2019 20:28:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=w9mTEpUU8HqDNecb5o48iWRPNUYJj0A0dWSnU2dZhWc=; b=dkyI7LAzG/QYQ9E41XeSfUPbfr
 n+9QC9iRfrNgRE57rwLo2fRcu4V6q5T/Bm7W0DDL8l0y9cXSuH6OGvPsQEodKLwSkNdwqWVX2iw0S
 FKqYx3CfiVjs2xN8JAaBrzW82zAye54QQDw1MsIivkCy3fupVOjanMhe62zdSRdHsOPI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=w9mTEpUU8HqDNecb5o48iWRPNUYJj0A0dWSnU2dZhWc=; b=mox/4fPYix/sdEOybuw6g8Syd0
 rSTgLvXcIZdB8ItftF0ir5g0nifdE4Hb6Ffzoh6d9V/woOUhrd0bJUxnB0HwUkajBz0DMuWJU8hWL
 vkpb1dKrgdM8xEV/Wu55NqUHNHZiqZuQdKnu85FCoKam0soOKeXF4D0KIEidCb2JyxfY=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iMeHw-00AeMw-5m
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 21 Oct 2019 20:28:26 +0000
Received: from gmail.com (unknown [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 95FF12067B;
 Mon, 21 Oct 2019 20:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1571689693;
 bh=yuyYH5txUJFQLMmsUgKioVsaetUA4KvG58kwl612GrY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=an64t09Xy6VRXqPUL3GAIscODkfzQVFm3dpCFD2yIaAOE6cETIfhBMD87q+snEVE5
 Rom5MN9qzxQyKuQxxFpZ/OaBDo1FMMMEv9GyNL58gw4pnsTnZfAmj0n8bJyss80aop
 /MWy7freDt/FEOXG2dZ+xcYBu84nosqqtIrbVFc0=
Date: Mon, 21 Oct 2019 13:28:12 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Message-ID: <20191021202811.GB122863@gmail.com>
Mail-Followup-To: linux-fscrypt@vger.kernel.org,
 "Theodore Y . Ts'o" <tytso@mit.edu>,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net,
 Chandan Rajendra <chandan@linux.ibm.com>
References: <20191009234038.224587-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191009234038.224587-1-ebiggers@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 1.7 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 1.8 FSL_HELO_FAKE          No description available.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1iMeHw-00AeMw-5m
Subject: Re: [f2fs-dev] [PATCH] fscrypt: remove struct fscrypt_ctx
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 "Theodore Y . Ts'o" <tytso@mit.edu>, Chandan Rajendra <chandan@linux.ibm.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Oct 09, 2019 at 04:40:38PM -0700, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Now that ext4 and f2fs implement their own post-read workflow that
> supports both fscrypt and fsverity, the fscrypt-only workflow based
> around struct fscrypt_ctx is no longer used.  So remove the unused code.
> 
> This is based on a patch from Chandan Rajendra's "Consolidate FS read
> I/O callbacks code" patchset, but rebased onto the latest kernel, folded
> __fscrypt_decrypt_bio() into fscrypt_decrypt_bio(), cleaned up
> fscrypt_initialize(), and updated the commit message.
> 
> Originally-from: Chandan Rajendra <chandan@linux.ibm.com>
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Applied to fscrypt.git for 5.5.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
