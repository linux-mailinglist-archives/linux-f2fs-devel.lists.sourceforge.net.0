Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Fh+FE3h0TmpsNAIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 08 Jul 2026 18:02:00 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D90D472864B
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 08 Jul 2026 18:01:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=KznaGn1I;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=f+QCROD2;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=iurg8tIb;
	dkim=fail ("body hash did not verify") header.d=suse.cz header.s=susede2_rsa header.b=WNKDs7kz;
	dkim=fail ("body hash did not verify") header.d=suse.cz header.s=susede2_ed25519 header.b="noLT/CiE";
	dkim=fail ("body hash did not verify") header.d=suse.cz header.s=susede2_rsa header.b=Uc5xxRgo;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HSDe4ZPk1g1pp6CvxXslu62eqqqRyxIvUFw9gUOzdWw=; b=KznaGn1Il3wgJkuK5E6GFH6gRH
	/Wp4Rfc9ZbKlKs9knSXpoKqktiYVsKABCNuDD/slylPkbLKE5y7GUl667wb5CIyQkbLHKMFjPS+gy
	C/La0/C7ZvG+A3TiG6h2HdfFVaBxvbTOLuPBGpxZuAr/zia8+RubmT7bhzwppnsBFxJE=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1whUiH-0007is-5I;
	Wed, 08 Jul 2026 16:01:29 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jack@suse.cz>) id 1whUi5-0007hw-QB
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 08 Jul 2026 16:01:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dEdqVpLfo0zxiVHZ5Hca2wH1NA58KJPOna1s5syEqgY=; b=f+QCROD2PWKz4EPC0YqceZEEHh
 u5G2O1qSmzvQJZ4MagMZBbkQnwnGNiXUzOPCHLu/NDc7h4if1RFv9DcvtyCrRTFpvu+GH19pKK5VJ
 cVKx58HxxnybCLC9yjxp6jF+wrJZvaeuZAvt5uio0bAM4y9NAAGrTarGsH+DUuwYbePE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dEdqVpLfo0zxiVHZ5Hca2wH1NA58KJPOna1s5syEqgY=; b=iurg8tIbOA+3Vogl+0U0EECuMV
 /z9mkERtKaSkKzyu7TwqVYZsWvPEuizIhUP33JWZCIHCi5zAuBmRGUxheNz8PilXE+NudyQ4reh3N
 RhTaSk9SRSRPSgHKj/nZs8ltpDaDvZmjJ2Qo1bCLlE72mB2y3j/GWD55+5jXqoQ/m+Ec=;
Received: from smtp-out2.suse.de ([195.135.223.131])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1whUi3-0001mt-4i for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 08 Jul 2026 16:01:18 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0AD1E75E59;
 Wed,  8 Jul 2026 16:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1783526468; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dEdqVpLfo0zxiVHZ5Hca2wH1NA58KJPOna1s5syEqgY=;
 b=WNKDs7kzsD+ejDCxTKpxh/4UTMXqRiwxqZCiY1OD1pWBkjLU2rt74Dml3QmeOC1IFOkdtW
 Pxj/JFWBJLRnNeYcces4x6xwoj3w3OA2MGYqXsnoZSHlh8+pZMDeyXqWQLcIuMQMx0kr6r
 e9EceKJSkjqq3s9V5zZ9wkpvoJGjkTE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1783526468;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dEdqVpLfo0zxiVHZ5Hca2wH1NA58KJPOna1s5syEqgY=;
 b=noLT/CiEA53ybMrIWsCOxXzY+gZEBmg/NRs1+ck8oaQ7jT31lPW5/RJYo1+J7LagCqdjMp
 wO2mJUvdaK/kexAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1783526465; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dEdqVpLfo0zxiVHZ5Hca2wH1NA58KJPOna1s5syEqgY=;
 b=Uc5xxRgoIzNp6zzYFJDKsFKGAMc3FBTT5Ybkvy1VjhQSiV2qAFh0Hko6vSQ8bm7pDSwYE1
 YbRKrlp8L2/e4YOG3kUyb5sEsEl/waFn0XySSyDP0ANsyPxjAYRyVb/R3ECEtiCNGSFDoj
 UxyUFNaDRYdsvCQmImLdVnj3h179DPg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1783526465;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dEdqVpLfo0zxiVHZ5Hca2wH1NA58KJPOna1s5syEqgY=;
 b=UnRPN2+Cgqe2o697vJKHkgoiBj4qT4nlVGmgjBXwxXguByKxHUSGI/B3w9rwapT+VITE6U
 sTAVfMTej8ersqAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0216A779AE;
 Wed,  8 Jul 2026 16:01:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id ks94AEF0TmpqXAAAD6G6ig
 (envelope-from <jack@suse.cz>); Wed, 08 Jul 2026 16:01:05 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 9E77BA12D6; Wed, 08 Jul 2026 18:01:04 +0200 (CEST)
Date: Wed, 8 Jul 2026 18:01:04 +0200
From: Jan Kara <jack@suse.cz>
To: Chao Yu <chao@kernel.org>
Message-ID: <xdicd4lsm44vsidxkrrul6waqdnb4gcof35e2pwurpnz7rvh6g@xjvhdqnen3vy>
References: <20260707113934.3003158-1-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260707113934.3003158-1-chao@kernel.org>
X-Spam-Flag: NO
X-Spam-Score: -4.01
X-Spam-Level: 
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue 07-07-26 19:39:33,
 Chao Yu wrote: > Commit 02117b8ae9c0
 ("f2fs: Set GF_NOFS in read_cache_page_gfp while doing > f2fs_quota_read")
 adds GFP_NOFS in f2fs_quota_read() to avoid below deadlock: > [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1whUi3-0001mt-4i
Subject: Re: [f2fs-dev] [PATCH v2 1/2] f2fs: quota: do not use GFP_NOFS in
 f2fs_quota_read()
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
Cc: jaegeuk@kernel.org, Jan Kara <jack@suse.cz>, linux-kernel@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.61 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:jack@suse.cz,m:linux-kernel@vger.kernel.org,m:willy@infradead.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[suse.cz];
	FORGED_SENDER(0.00)[jack@suse.cz,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,infradead.org:email,suse.cz:from_mime,suse.cz:email];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jack@suse.cz,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,suse.cz:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RSPAMD_EMAILBL_FAIL(0.00)[chao.kernel.org:query timed out,jack.suse.cz:query timed out,linux-f2fs-devel.lists.sourceforge.net:query timed out,jack@suse.cz:query timed out,linux-f2fs-devel-bounces@lists.sourceforge.net:query timed out];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D90D472864B

On Tue 07-07-26 19:39:33, Chao Yu wrote:
> Commit 02117b8ae9c0 ("f2fs: Set GF_NOFS in read_cache_page_gfp while doing
> f2fs_quota_read") adds GFP_NOFS in f2fs_quota_read() to avoid below deadlock:
> 
> - do_sys_open
>  - vfs_open
>   - dquot_file_open
>    - dquot_initialize
>     - dqget
>      - dquot_acquire
>       : locks &dqopt->dqio_mutex (VFS Quota Mutex)
>       - qtree_read_dquot
>        - f2fs_quota_read
>         - read_mapping_page (GFP_KERNEL / allows GFP_FS)
>          - __alloc_pages_nodemask
>           - try_to_free_pages (Direct Reclaim)
>            - prune_icache_sb
>             - evict
>              - f2fs_evict_inode
>               - dquot_drop
>                - dqput
>                 - dquot_commit
>                  : tries to lock &dqopt->dqio_mutex again
>                  ==> DEADLOCK (waiting for itself)
> 
> As Jan Kara mentioned, quota system has fixed this issue w/ commit
> 537e11cdc7a6 ("quota: Prevent memory allocation recursion while holding
> dq_lock"), so this GFP_NOFS flag should be relic, let's use GFP_KERNEL
> instead.
> 
> Cc: Jan Kara <jack@suse.cz>
> Cc: Matthew Wilcox <willy@infradead.org>
> Signed-off-by: Chao Yu <chao@kernel.org>

Looks sound to me. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
> v2:
> - fix to use GFP_KERNEL instead of 0.
>  fs/f2fs/super.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index da468df058eb..b1725ca68010 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -3168,7 +3168,7 @@ static ssize_t f2fs_quota_read(struct super_block *sb, int type, char *data,
>  
>  repeat:
>  		folio = mapping_read_folio_gfp(mapping, off >> PAGE_SHIFT,
> -				GFP_NOFS);
> +				GFP_KERNEL);
>  		if (IS_ERR(folio)) {
>  			if (PTR_ERR(folio) == -ENOMEM) {
>  				memalloc_retry_wait(GFP_NOFS);
> -- 
> 2.49.0
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
