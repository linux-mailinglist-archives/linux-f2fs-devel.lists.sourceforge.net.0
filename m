Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CECE52718F3
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 21 Sep 2020 03:11:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kKAMa-0001uP-9r; Mon, 21 Sep 2020 01:11:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <krisman@collabora.com>) id 1kKAMY-0001uH-4q
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 21 Sep 2020 01:11:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:In-Reply-To:
 Date:References:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9hx8NHoxrgAmUHDrDlml2tjQ7eVsFxqE7uamyQPaNuo=; b=f5/je+Hz7Lv/qWs48lHBzDzxJy
 GEXsByaEU0+pWOET8F7pXT59aRUiSLsTNpW4ae1dGJGN1t1jKFTHA7PTiLVWq2PltYzYfHOtHZ+QL
 f4ZghxU1rpv9bMbIOW0vKmwfw6pl07QSUhy8FQ1djpnYwAdS1ZnSDCxycunRg7DJ84FM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9hx8NHoxrgAmUHDrDlml2tjQ7eVsFxqE7uamyQPaNuo=; b=L3ptdFcxJEPVBJi/qeKVQn0V0F
 9lFAiUJP/Be7oTxRWSwf2xAq61M5YLstIu12s3HbzUhJtoEurp2rKEryMMtBgHImNo7gw3ILx6re3
 3Q7+hKpH7pEGEe8DVIdegrziR5uQiQyqR4FoRlX3kDlXUGUPzB/3KVFq/c/Rx4TA7JyA=;
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kKAMS-001Aks-VC
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 21 Sep 2020 01:11:26 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: krisman) with ESMTPSA id CA5D628BA5A
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: Daniel Rosenberg <drosen@google.com>
Organization: Collabora
References: <20200708091237.3922153-1-drosen@google.com>
 <20200708091237.3922153-5-drosen@google.com>
Date: Sun, 20 Sep 2020 21:10:57 -0400
In-Reply-To: <20200708091237.3922153-5-drosen@google.com> (Daniel Rosenberg's
 message of "Wed, 8 Jul 2020 02:12:37 -0700")
Message-ID: <87lfh4djdq.fsf@collabora.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
X-Headers-End: 1kKAMS-001Aks-VC
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
Cc: Theodore Ts'o <tytso@mit.edu>, Eric Biggers <ebiggers@google.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Eric Biggers <ebiggers@kernel.org>, linux-fscrypt@vger.kernel.org,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 kernel-team@android.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Daniel Rosenberg <drosen@google.com> writes:

> This switches ext4 over to the generic support provided in
> the previous patch.
>
> Since casefolded dentries behave the same in ext4 and f2fs, we decrease
> the maintenance burden by unifying them, and any optimizations will
> immediately apply to both.
>
> Signed-off-by: Daniel Rosenberg <drosen@google.com>
> Reviewed-by: Eric Biggers <ebiggers@google.com>
>  
>  #ifdef CONFIG_UNICODE
> -	if (EXT4_SB(parent->i_sb)->s_encoding && IS_CASEFOLDED(parent)) {
> +	if (parent->i_sb->s_encoding && IS_CASEFOLDED(parent)) {
>  		if (fname->cf_name.name) {
>  			struct qstr cf = {.name = fname->cf_name.name,
>  					  .len = fname->cf_name.len};
> @@ -2171,9 +2171,6 @@ static int ext4_add_entry(handle_t *handle, struct dentry *dentry,
>  	struct buffer_head *bh = NULL;
>  	struct ext4_dir_entry_2 *de;
>  	struct super_block *sb;
> -#ifdef CONFIG_UNICODE
> -	struct ext4_sb_info *sbi;
> -#endif
>  	struct ext4_filename fname;
>  	int	retval;
>  	int	dx_fallback=0;
> @@ -2190,9 +2187,8 @@ static int ext4_add_entry(handle_t *handle, struct dentry *dentry,
>  		return -EINVAL;
>  
>  #ifdef CONFIG_UNICODE
> -	sbi = EXT4_SB(sb);
> -	if (ext4_has_strict_mode(sbi) && IS_CASEFOLDED(dir) &&
> -	    sbi->s_encoding && utf8_validate(sbi->s_encoding, &dentry->d_name))
> +	if (sb_has_strict_encoding(sb) && IS_CASEFOLDED(dir) &&
> +	    sb->s_encoding && utf8_validate(sb->s_encoding, &dentry->d_name))
>  		return -EINVAL;

hm, just noticed the sb->s_encoding check here is superfluous, since the
has_strict_mode() cannot be true if !s_encoding.  Not related to this
patch though.

Daniel, are you still working on getting this upstream?  The fscrypt
support would be very useful for us. :)

In the hope this will get upstream, as its been flying for a while and
looks correct.

Reviewed-by: Gabriel Krisman Bertazi <krisman@collabora.com>

-- 
Gabriel Krisman Bertazi


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
