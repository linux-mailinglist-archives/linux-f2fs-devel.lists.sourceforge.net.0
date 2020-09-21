Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 64EAC2731F5
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 21 Sep 2020 20:30:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kKQZj-0001ij-SU; Mon, 21 Sep 2020 18:30:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kKQZi-0001iU-Jz
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 21 Sep 2020 18:30:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+3oLhdr8w+XAMAcjdV9Rr25rnzs8e4/4Eqnd3yjHUug=; b=ZU74mj/r3dp0FcPUcbVbAzltGw
 eOqA5fBXqGpBcYtaaqLS/Slahlif7PfQLj+Ud4nWfIFAAaaIU1/OqLi/J1z97NG52WXtfnXSJjRrJ
 v/8GdyKAkB+HJhchDtQ/AA0KK9QhIGYuxOU3VAuU+bE68OhLOIp3fqozLlddHsQmwg2A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+3oLhdr8w+XAMAcjdV9Rr25rnzs8e4/4Eqnd3yjHUug=; b=bUeULoDuxOgibJATCmoNbFliwp
 pB7MI0vinnCpE1a0qUEpH2n/N5UjRdCrdEsXSx/Q1WnAlBdxnVWT6KRAiCdGHfzQ/RUtgE9awmxYe
 /+9AnvJbiz6tBO7ex4ueMS+NOkoHKbXOAivt2d3obI3R4TPf3SNgY9Omb0TV2/ie2mtU=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kKQZX-002IRM-MK
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 21 Sep 2020 18:30:06 +0000
Received: from gmail.com (unknown [104.132.1.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DC2A220758;
 Mon, 21 Sep 2020 18:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600712990;
 bh=xfKd1sWDGNhVdepPEKC1RdDT0tu6IQ/iGDe1bIAhKWE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eeL3T5WAha4l7IADwnyUubjJZSCetFw5JMJ+kxtH/TvUthibhmb+DvBnGmWcChcbt
 iE30z75SNSivfly/Ae3pYKjc5xglPEaExNgz/vjPN/BEKGQ2BYDU8wDgNsNkKBn1Cm
 QSWUJ0N/kinYBsYwIrCEsanyApVuhkGpI+Dtzz9Y=
Date: Mon, 21 Sep 2020 11:29:48 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Gabriel Krisman Bertazi <krisman@collabora.com>
Message-ID: <20200921182948.GA885472@gmail.com>
References: <20200708091237.3922153-1-drosen@google.com>
 <20200708091237.3922153-5-drosen@google.com>
 <87lfh4djdq.fsf@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87lfh4djdq.fsf@collabora.com>
X-Spam-Score: -1.6 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kKQZX-002IRM-MK
Subject: Re: [f2fs-dev] [PATCH v12 4/4] ext4: Use generic casefolding support
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
Cc: Theodore Ts'o <tytso@mit.edu>, Daniel Rosenberg <drosen@google.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 kernel-team@android.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sun, Sep 20, 2020 at 09:10:57PM -0400, Gabriel Krisman Bertazi wrote:
> Daniel Rosenberg <drosen@google.com> writes:
> 
> > This switches ext4 over to the generic support provided in
> > the previous patch.
> >
> > Since casefolded dentries behave the same in ext4 and f2fs, we decrease
> > the maintenance burden by unifying them, and any optimizations will
> > immediately apply to both.
> >
> > Signed-off-by: Daniel Rosenberg <drosen@google.com>
> > Reviewed-by: Eric Biggers <ebiggers@google.com>
> >  
> >  #ifdef CONFIG_UNICODE
> > -	if (EXT4_SB(parent->i_sb)->s_encoding && IS_CASEFOLDED(parent)) {
> > +	if (parent->i_sb->s_encoding && IS_CASEFOLDED(parent)) {
> >  		if (fname->cf_name.name) {
> >  			struct qstr cf = {.name = fname->cf_name.name,
> >  					  .len = fname->cf_name.len};
> > @@ -2171,9 +2171,6 @@ static int ext4_add_entry(handle_t *handle, struct dentry *dentry,
> >  	struct buffer_head *bh = NULL;
> >  	struct ext4_dir_entry_2 *de;
> >  	struct super_block *sb;
> > -#ifdef CONFIG_UNICODE
> > -	struct ext4_sb_info *sbi;
> > -#endif
> >  	struct ext4_filename fname;
> >  	int	retval;
> >  	int	dx_fallback=0;
> > @@ -2190,9 +2187,8 @@ static int ext4_add_entry(handle_t *handle, struct dentry *dentry,
> >  		return -EINVAL;
> >  
> >  #ifdef CONFIG_UNICODE
> > -	sbi = EXT4_SB(sb);
> > -	if (ext4_has_strict_mode(sbi) && IS_CASEFOLDED(dir) &&
> > -	    sbi->s_encoding && utf8_validate(sbi->s_encoding, &dentry->d_name))
> > +	if (sb_has_strict_encoding(sb) && IS_CASEFOLDED(dir) &&
> > +	    sb->s_encoding && utf8_validate(sb->s_encoding, &dentry->d_name))
> >  		return -EINVAL;
> 
> hm, just noticed the sb->s_encoding check here is superfluous, since the
> has_strict_mode() cannot be true if !s_encoding.  Not related to this
> patch though.
> 
> Daniel, are you still working on getting this upstream?  The fscrypt
> support would be very useful for us. :)
> 
> In the hope this will get upstream, as its been flying for a while and
> looks correct.
> 
> Reviewed-by: Gabriel Krisman Bertazi <krisman@collabora.com>

We couldn't get a response from Ted, so instead Jaegeuk has applied patches 1-3
to f2fs/dev for 5.10.  Hopefully Ted will take the ext4 patch for 5.11.

I believe that Daniel is planning to resend the actual encryption+casefolding
support soon, but initially only for f2fs since that will be ready first.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
