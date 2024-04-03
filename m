Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5E8896E07
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  3 Apr 2024 13:22:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rryhO-0000n2-59;
	Wed, 03 Apr 2024 11:22:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jack@suse.cz>) id 1rryhM-0000mw-Ke
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 03 Apr 2024 11:22:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QUubzZCvH9kKHwxEUHRTCcZPEs1hSs/vSgYqSwznXr4=; b=U10P4avmUDmyT0W6TSXxPbeSvP
 3TlHdd7SdfoUb/6hIYONY66Jsjbr0UaP2Ie96poBhK2jgoaHebH+TdxxtHApvZ1IHNtrFGBZwPusM
 hUmwGtCMYzvajroMJuQ6MSDmJkwmJQ0/FWi9k3japKAbYfW1lBMRLSDaAiG3UhhN8qTs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QUubzZCvH9kKHwxEUHRTCcZPEs1hSs/vSgYqSwznXr4=; b=Ur3hAK2vQxC/PUxPyUtIlphKsB
 x520/aIrWwrhJB28trjpEV3dbl8Tnb0zcw+vY+9yDiZ/HSUJz63yQbnl5hnoCWdW23J14CHSNW6VA
 +1viuU2q0xbFDSIuLr9/qJ6qKQw/gA/0WlJKejlkAEqZpepQSf8HlsdsB4sWZ4CZ4N3w=;
Received: from smtp-out1.suse.de ([195.135.223.130])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rryhL-0001hA-Hr for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 03 Apr 2024 11:22:32 +0000
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3841B35288;
 Wed,  3 Apr 2024 11:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1712143340; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QUubzZCvH9kKHwxEUHRTCcZPEs1hSs/vSgYqSwznXr4=;
 b=DDJfiSBRvnRvc0NSrGBWmcDhD8fe7TOALaFjEzp2fpBhtYpI4jGxQKLA3+l1QQzdMRimzX
 IQEap34DDcTzJQ9Yq3z062vzUdnUQNrGZf8I3Oe/jr3My0RIbNu6t7omRzXWMbpabspnLc
 PLp6IF8n+5lEVbD2mOAQMSJezSx2cBk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1712143340;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QUubzZCvH9kKHwxEUHRTCcZPEs1hSs/vSgYqSwznXr4=;
 b=uoMMMBa/IrIQ9KZDERsDt9OoPPcUgK86+ANehXQPJPaMYhaZWnL43IEBU2MBLVQBwplHKn
 5oHScmosS95C5kAg==
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 28DB813357;
 Wed,  3 Apr 2024 11:22:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id hubzCew7DWb0IAAAn2gu4w
 (envelope-from <jack@suse.cz>); Wed, 03 Apr 2024 11:22:20 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id CBB66A0814; Wed,  3 Apr 2024 13:22:04 +0200 (CEST)
Date: Wed, 3 Apr 2024 13:22:04 +0200
From: Jan Kara <jack@suse.cz>
To: Sweet Tea Dorminy <sweettea-kernel@dorminy.me>
Message-ID: <20240403112204.l5zmyirxueod2o5l@quack3>
References: <cover.1712126039.git.sweettea-kernel@dorminy.me>
 <20935230b7513031ac497e3afe8446650d20fb1e.1712126039.git.sweettea-kernel@dorminy.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20935230b7513031ac497e3afe8446650d20fb1e.1712126039.git.sweettea-kernel@dorminy.me>
X-Spam-Score: -1.03
X-Spamd-Result: default: False [-1.03 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-0.999]; RCPT_COUNT_TWELVE(0.00)[20];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; MID_RHS_NOT_FQDN(0.50)[];
 RCVD_TLS_ALL(0.00)[]; BAYES_HAM(-0.23)[72.57%]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed 03-04-24 03:22:48,
 Sweet Tea Dorminy wrote: > Signed-off-by:
 Sweet Tea Dorminy <sweettea-kernel@dorminy.me> > --- > fs/ext4/extents.c
 | 2 +- > 1 file changed, 1 insertion(+), 1 deletion(-) > > [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: suse.cz]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.223.130 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1rryhL-0001hA-Hr
Subject: Re: [f2fs-dev] [PATCH v3 07/13] ext4: fiemap: return correct extent
 physical length
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
Cc: linux-bcachefs@vger.kernel.org, Christian Brauner <brauner@kernel.org>,
 Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, linux-btrfs@vger.kernel.org,
 Brian Foster <bfoster@redhat.com>, Kent Overstreet <kent.overstreet@linux.dev>,
 linux-doc@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>,
 linux-kernel@vger.kernel.org, Chris Mason <clm@fb.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@meta.com, =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed 03-04-24 03:22:48, Sweet Tea Dorminy wrote:
> Signed-off-by: Sweet Tea Dorminy <sweettea-kernel@dorminy.me>
> ---
>  fs/ext4/extents.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/ext4/extents.c b/fs/ext4/extents.c
> index 2adade3c202a..4874f757e1bd 100644
> --- a/fs/ext4/extents.c
> +++ b/fs/ext4/extents.c
> @@ -2194,7 +2194,7 @@ static int ext4_fill_es_cache_info(struct inode *inode,
>  
>  	while (block <= end) {
>  		next = 0;
> -		flags = 0;
> +		flags = FIEMAP_EXTENT_HAS_PHYS_LEN;

OK, but we should then pass (__u64)es.es_len << blksize_bits as physical
extent length below, shouldn't we?

>  		if (!ext4_es_lookup_extent(inode, block, &next, &es))
>  			break;
>  		if (ext4_es_is_unwritten(&es))

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
