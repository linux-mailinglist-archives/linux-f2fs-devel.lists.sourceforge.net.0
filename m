Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0567CA55F0C
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  7 Mar 2025 04:58:22 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tqOql-0000se-H8;
	Fri, 07 Mar 2025 03:58:16 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ddiss@suse.de>) id 1tqOqj-0000sK-GX
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Mar 2025 03:58:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4o8aIqRMXFiWv6nSz2UHztvIYHb6zxhdcrhJDENIKyc=; b=ewnfbVYmzzDMAgOHsgrT486emP
 vWve4ggMbZ01TOC0pI4DOK1jqUoRaWcd0i3pynM4EywS5iRPiMYFOwZkLLLQzx4TRXso/uBzl2B1z
 kVvs+yRrz9tdrXX2Gea0SvJwcpmFMdjymnuECpveEYqAeHyuItNv4Ipfwe+79Ts2D7w4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4o8aIqRMXFiWv6nSz2UHztvIYHb6zxhdcrhJDENIKyc=; b=Ua/v614ZI0qW9nCsiypDmRUX9T
 vIVQD8PusREzd73Phfxq3lRjkEsgAA1iVRpK+M9y9y6SD1CexBJfB08ADNyVMTONLkTQMrI6TQlrs
 HpHPmKCpuUEwg1/E02qrJlC94ukhvJSBulD4q7+jiP+xSo1HjCQQE06lHaO/uW3cgCbY=;
Received: from smtp-out1.suse.de ([195.135.223.130])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1tqOqe-00011h-Gz for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Mar 2025 03:58:14 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E3CF4211B5;
 Fri,  7 Mar 2025 03:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1741319877; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4o8aIqRMXFiWv6nSz2UHztvIYHb6zxhdcrhJDENIKyc=;
 b=wlht1gpYnN5SmHI42RDa+AIWQgKo/iKQhaT9yDWLH3yVYh5sksSrxFrOtkq5PRAGMbhN+f
 UHQgjAbiaNo1b6EIW7g9mwCht4nVgI0ZIyI2rFa+v8fGgBZUL//eyQSpogNPrE08cqGNF8
 Kcn6t/y5NJUxOc8O22cmFaaltB7nebw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1741319877;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4o8aIqRMXFiWv6nSz2UHztvIYHb6zxhdcrhJDENIKyc=;
 b=E0iA8HcjjZZTT0wPyVe+HZYuond7Ve6AIw8sOmbeN+Rche5/Ew0ulQ+dna4eK73dboT0M2
 Cj1/pASzpScehKBw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1741319876; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4o8aIqRMXFiWv6nSz2UHztvIYHb6zxhdcrhJDENIKyc=;
 b=ynvxscYm61TsqdrAMWiGEnDOItLiHtc5A/VOlWigseoGD/mw6We4vfnGCef6lKN39+eL0/
 sE3t23RO420xKRkhp3U3wfPX4u6MpynqKb21MeLPSxFantnE7vPA5T7ujlOYZ12Cfxuo/e
 oTJREtLZjnekc8/FLBp03Bq86d/eAFM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1741319876;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4o8aIqRMXFiWv6nSz2UHztvIYHb6zxhdcrhJDENIKyc=;
 b=6uLa5+624FKsVXx3hGB7aBKNJbOnDofhNn1ZHoZ8J9DnxjA+VUzweKvFI+yctosj5x2RO1
 Zk1sUlTvXFRt3AAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D02C813726;
 Fri,  7 Mar 2025 03:57:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id ytCfIcJuymcBaQAAD6G6ig
 (envelope-from <ddiss@suse.de>); Fri, 07 Mar 2025 03:57:54 +0000
Date: Fri, 7 Mar 2025 14:57:49 +1100
From: David Disseldorp <ddiss@suse.de>
To: Chao Yu <chao@kernel.org>
Message-ID: <20250307145749.7bda92e8.ddiss@suse.de>
In-Reply-To: <20250306081809.2397527-3-chao@kernel.org>
References: <20250306081809.2397527-1-chao@kernel.org>
 <20250306081809.2397527-3-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-0.990]; MIME_GOOD(-0.10)[text/plain];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+]; TO_DN_SOME(0.00)[];
 MISSING_XM_UA(0.00)[]; RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_FIVE(0.00)[5]; FROM_EQ_ENVFROM(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo, suse.de:email,
 suse.de:mid]
X-Spam-Score: -3.30
X-Spam-Flag: NO
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, 6 Mar 2025 16:18:08 +0800, Chao Yu wrote: > Support
 f2fs in _repair_scratch_fs(), and use -f to repair the image > forcely. >
 > Cc: Jaegeuk Kim <jaegeuk@kernel.org> > Signed-off-by: Chao Yu
 <chao@kernel.org> > --- > common/rc | 3 +++ > 1 file [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.223.130 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [195.135.223.130 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [195.135.223.130 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1tqOqe-00011h-Gz
Subject: Re: [f2fs-dev] [PATCH 3/4] common/rc: support f2fs in
 _repair_scratch_fs
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
Cc: jaegeuk@kernel.org, Zorro Lang <zlang@kernel.org>, fstests@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu,  6 Mar 2025 16:18:08 +0800, Chao Yu wrote:

> Support f2fs in _repair_scratch_fs(), and use -f to repair the image
> forcely.
> 
> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  common/rc | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/common/rc b/common/rc
> index ca755055..bf24da4e 100644
> --- a/common/rc
> +++ b/common/rc
> @@ -1500,6 +1500,9 @@ _repair_scratch_fs()
>  	# want the test to fail:
>  	_check_scratch_fs
>  	;;
> +    f2fs)
> +	fsck -t $FSTYP -f $SCRATCH_DEV
> +	;;
>      *)
>  	local dev=$SCRATCH_DEV
>  	local fstyp=$FSTYP

Reviewed-by: David Disseldorp <ddiss@suse.de>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
