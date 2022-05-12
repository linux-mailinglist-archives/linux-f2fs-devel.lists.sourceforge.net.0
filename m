Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD3A5244DA
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 May 2022 07:25:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1np1Ju-0000L4-Kf; Thu, 12 May 2022 05:25:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ebiggers@kernel.org>) id 1np1Ju-0000Kx-04
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 12 May 2022 05:25:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=e7zE1JsHSHWBOaBljZk+HeQvB0xi+TeIP9NovIJmRtQ=; b=gZssS/itVV//aYuWfsINvNpF4O
 k9pnYCzTgevXiM6/zZdE9NxFPCEXT3n3OcL9+pF1LI5PNxBwafPVPcxvNk44P5XueEqFGVpIhu6af
 Qf86AkIxqYdDKYP1gFzlNjITZmy9Ae8TY9hqF0qm6bhati7o8HWEXMmjDtapmhRhk9Dg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=e7zE1JsHSHWBOaBljZk+HeQvB0xi+TeIP9NovIJmRtQ=; b=Gr8JXAMbYb64Mj7FOz7AmKY1La
 SooOWAkDQby/PnvmEcvQAQcLsPR0Fr7+n5NdCKQtFzy5nsSko6y3DDVcO2zmyNH/6588LhlS+Efxl
 U6DADw/IidAu/waZfEzld++hGz3ZLyIc5huPgIWZpPv1Ese2WF4008tmYExJd1xCtjTA=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1np1Jo-009Osl-ON
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 12 May 2022 05:25:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 708EEB825FA;
 Thu, 12 May 2022 05:24:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9A25C385B8;
 Thu, 12 May 2022 05:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652333089;
 bh=vSdULYbuchXcmCl0qmJRHssrYI4NBtqHEWcUfEuYAsE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WKpX7lQYDtEIRtY5WTaSKr+byuGEClmCJU6sNHJBXgfIfTXEhbbAYPIiAwUVrdfx+
 Jy94paFDiH0tt9FgpWq0z+ljNzs3Ltu43gO6tDRWSY9HQ2kTKUYz9mEtNZCvlW3ktz
 ng0+lJN6SyCs6g1AltmU1NnfsqP2hUFGEDz4wd3G9UfEhNpa/OqWMyc2U7uc8JZlRF
 CVpSLynZ6IfkXMEH7Xa/a98UFHjy/3Jf+Nmcogx8sfbWyj2YWrdXWZc8PgNx7So8y5
 Yx3SgG3X1I2+WW8tov+lPHpirRyzaMX+7rzQlNdfpVqURvRGcfAnY44RuLD+OTq7/6
 R9FZQn1Mipopg==
Date: Wed, 11 May 2022 22:24:47 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Gabriel Krisman Bertazi <krisman@collabora.com>
Message-ID: <YnyaH4WI2TRa/57R@sol.localdomain>
References: <20220511193146.27526-1-krisman@collabora.com>
 <20220511193146.27526-8-krisman@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220511193146.27526-8-krisman@collabora.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, May 11, 2022 at 03:31:43PM -0400, Gabriel Krisman
 Bertazi wrote: > Matching case-insensitive names is a generic operation and
 can be shared > with f2fs. Move it next to the rest of the shared [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1np1Jo-009Osl-ON
Subject: Re: [f2fs-dev] [PATCH v4 07/10] ext4: Move ext4_match_ci into libfs
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
Cc: linux-ext4@vger.kernel.org, tytso@mit.edu,
 linux-f2fs-devel@lists.sourceforge.net, adilger.kernel@dilger.ca,
 jaegeuk@kernel.org, kernel@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, May 11, 2022 at 03:31:43PM -0400, Gabriel Krisman Bertazi wrote:
> Matching case-insensitive names is a generic operation and can be shared
> with f2fs.  Move it next to the rest of the shared casefold fs code.
> 
> Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>
> ---
>  fs/ext4/namei.c    | 62 +---------------------------------------------
>  fs/libfs.c         | 61 +++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/fs.h |  3 +++
>  3 files changed, 65 insertions(+), 61 deletions(-)

It might be a good idea to split this into two patches, one for the libfs part
and one for the ext4 part.  That would make sorting out the dependencies of this
series easier in case it doesn't all go in in one cycle.

> +/**
> + * generic_ci_match() - Match (case-insensitive) a name with a dirent.
> + * @parent: Inode of the parent of the dentry.
> + * @uname: name under lookup.
> + * @de_name: Dirent name.
> + * @de_name_len: dirent name length.
> + *
> + * Test whether a case-insensitive directory entry matches the filename
> + * being searched.
> + *
> + * Return: > 0 if the directory entry matches, 0 if it doesn't match, or
> + * < 0 on error.
> + */
> +int generic_ci_match(const struct inode *parent,
> +		     const struct unicode_name *uname,
> +		     u8 *de_name, size_t de_name_len)

de_name should be const, like it is in the f2fs version.  It does get cast away
temporarily when it is stored in a fscrypt_str, but it never gets modified (and
must not be) so const is appropriate.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
