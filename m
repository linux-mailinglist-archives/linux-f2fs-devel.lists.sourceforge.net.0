Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB914E354C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 22 Mar 2022 01:14:58 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nWSAo-0006Hj-4w; Tue, 22 Mar 2022 00:14:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1nWSAn-0006HY-2H
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 22 Mar 2022 00:14:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mc6VIsPWlo/4ioaF33nKF/XOFv/uQBwbVaqsY0VmVB8=; b=UA3+asIDQU+CVVPYWyXNMBEteh
 Sx74Yfoe22n66a2LnpplLY5tf7ui5U14oui7DMtpnpuyJLiEhoa+qGNqQ8mkciQ1CZIACyir382B0
 LGCRd74ZEH3wTVnMkeTuXYlxQjyApyvT7NfBbRLKTdjYoNMbZtjyMc2ratGlsnLC6ru8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mc6VIsPWlo/4ioaF33nKF/XOFv/uQBwbVaqsY0VmVB8=; b=hdPrmQiNX+AMCkjoj96G9tSKwc
 N51qJKXEKDPwhG+0YDFq0Fgl+mJbKz+oifU9qJJjI7xx0G+e0FPktcpP5ryqs5CnbxKFbbjyo/NX0
 ZvUWSov6I0k9tp9UoSs2fMi0oxwS71Fn8Yj7hCyMjHQoBOJC/9zHTcsN/3Cy19FFBYTM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nWSAk-00031Q-UA
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 22 Mar 2022 00:14:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B222461591
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 22 Mar 2022 00:14:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FA3AC340EE;
 Tue, 22 Mar 2022 00:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647908080;
 bh=ptq/x+NmLEN93pVa3brLVtmIuD2jc5p162570UhOGQ0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CmGegkS2ilwEKTVAUxejCavZAzG3ZrQ+HgomCHaYhL/c0BdCu8AdIN+Te3GCUGPEl
 gnUHJEhnMqtWIr8bIP/z55kCLyBYkGiXsDLO4TKC6mgpgvcYP60ZHXe1lXSowrjQTH
 df0W02qQ1wiAEjBYF7NlnCyFnC1YFqJJ2KzN8Qd2R2pU0Ur9cRRoKiX7SRWa6EBGE9
 F8/3vMBGbbTKEdagT4TANbEz/KSeQOzOHx4K0g9atyX+m8QlK5rcS7Aej89TnqYAJc
 20CSPIMvwnEeROONYUgO5fwkvbJ9slOQ0mgAlBqVjiDCgLphKSLwIugQZ/YM86eHQo
 QesHDFlCDJ6pw==
Date: Mon, 21 Mar 2022 17:14:38 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <YjkU7tP+Rjs90X38@google.com>
References: <20220321223315.3228326-1-jaegeuk@kernel.org>
 <Yjj/L5/kwc5Oo74E@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Yjj/L5/kwc5Oo74E@gmail.com>
X-Spam-Score: -6.4 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 03/21, Eric Biggers wrote: > On Mon, Mar 21,
 2022 at 03:33:15PM
 -0700, Jaegeuk Kim wrote: > > This was used in Android for a long time. Let's
 upstream it. > > > > You still need to explain why this [...] 
 Content analysis details:   (-6.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nWSAk-00031Q-UA
Subject: Re: [f2fs-dev] [PATCH] f2fs: introduce data read/write showing path
 info
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 03/21, Eric Biggers wrote:
> On Mon, Mar 21, 2022 at 03:33:15PM -0700, Jaegeuk Kim wrote:
> > This was used in Android for a long time. Let's upstream it.
> > 
> 
> You still need to explain why this is useful.
> 
> > +static inline char *f2fs_get_pathname(char *buf, int len, struct inode *inode)
> > +{
> > +	char *path;
> > +	struct dentry *d;
> > +
> > +	/*
> > +	 * d_obtain_alias() will either iput() if it locates an existing
> > +	 * dentry or transfer the reference to the new dentry created.
> > +	 * So get an extra reference here.
> > +	 */
> > +	ihold(inode);
> > +	d = d_obtain_alias(inode);
> 
> Why does this use d_obtain_alias() to get a dentry instead of just using the
> dentry of the open file?

:( I shouldn't copy the code from aosp simply.

> 
> - Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
