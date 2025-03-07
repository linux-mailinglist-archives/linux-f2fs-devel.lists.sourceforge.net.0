Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A6BA55F07
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  7 Mar 2025 04:57:43 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tqOqD-0000Cx-Iz;
	Fri, 07 Mar 2025 03:57:40 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ddiss@suse.de>) id 1tqOqB-0000Cn-5i
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Mar 2025 03:57:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3EqZiiZ+ozrGjSz/52JKPoRDB4+ZJlXZJl90Ra/Iwqk=; b=azS4NIzuWsTu5gZZsRNi/RWeQP
 67yGxnC6zveC9D0JI6S2mm4gDTfvVSJfWmN+JYl+fFnLnOMWJ4AvxkSYUtcFatshQMdq3hpqEuZ93
 YUJfmR9dbTQP6P8gHZ5yNUd1m/pvr3PZHOZv9ozO9UB0OvFhZ59IjZUwPRs5zpo3nS0Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3EqZiiZ+ozrGjSz/52JKPoRDB4+ZJlXZJl90Ra/Iwqk=; b=l2OdYf+LdqnwTBFtK3dIyDGzgI
 Xcl5VV48udJBE+HyvmVAlNYbz+Dc/6e+hvhcA3qMuUCUqzlclTJhtP+XsD8D+UEoxfmw3YOtQpWI+
 lgJnQROKLJXxu8zEvcxPkElJzzPZwCFhB5S2DiVt8bXBNWjbGPHJhl52GkgX3li1WnCQ=;
Received: from smtp-out1.suse.de ([195.135.223.130])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1tqOpz-0000vp-OT for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Mar 2025 03:57:38 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EE469211B5;
 Fri,  7 Mar 2025 03:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1741319836; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3EqZiiZ+ozrGjSz/52JKPoRDB4+ZJlXZJl90Ra/Iwqk=;
 b=rR/AWl5ZKqoN+5REtULvSYyI3QD+hiMLnWIc953AHhrBqdVqBef4zSrRvuIiwIyL8p87kx
 5U80e7B2WnhP6GzEdnuwxLZbzLNxc0ofQanScyVmXx7R2l0SSTWMT5lrMWsWY7inAVXi+o
 xcv1fSc43rMfj9H2uADEG/cXCCyG7aQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1741319836;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3EqZiiZ+ozrGjSz/52JKPoRDB4+ZJlXZJl90Ra/Iwqk=;
 b=NmG3PqUHOG/gElZS3aoXB0ayujHyotRawvpk/QtDuyDCgGSUCn3E5/avYFHqMgrHZuuW7f
 884u2AeXJNqax/Bw==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=NtHfIdNt;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Pl38iTOt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1741319835; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3EqZiiZ+ozrGjSz/52JKPoRDB4+ZJlXZJl90Ra/Iwqk=;
 b=NtHfIdNt5/ve51A4lGurC9eolmseMxD3F/EEP6H3cOkLInqowwls3nvVI70cFxK4/8TbMw
 vKWSxNJmTAD81FF5eLCYcyLOVLaHNs8i15hP+jwoZzJqat9dSoq5akfCOiyXzFwAfH/d0T
 9xKnGi7G8WiZGlGO3wuTFtgHOeMTAvw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1741319835;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3EqZiiZ+ozrGjSz/52JKPoRDB4+ZJlXZJl90Ra/Iwqk=;
 b=Pl38iTOtVXYr3ej2bIJsRi3Gdth6zi0Xns067VcrO3AVfi2mKSzxcgSPERsBa53QA+l3iK
 7dbYuUtMNe8G6KAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E3FB613726;
 Fri,  7 Mar 2025 03:57:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id A0R/JpluymfOaAAAD6G6ig
 (envelope-from <ddiss@suse.de>); Fri, 07 Mar 2025 03:57:13 +0000
Date: Fri, 7 Mar 2025 14:57:01 +1100
From: David Disseldorp <ddiss@suse.de>
To: Chao Yu <chao@kernel.org>
Message-ID: <20250307145701.3676d880.ddiss@suse.de>
In-Reply-To: <20250306081809.2397527-2-chao@kernel.org>
References: <20250306081809.2397527-1-chao@kernel.org>
 <20250306081809.2397527-2-chao@kernel.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: EE469211B5
X-Spam-Score: -3.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
 MIME_TRACE(0.00)[0:+]; MISSING_XM_UA(0.00)[];
 TO_DN_SOME(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_FIVE(0.00)[5]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid,suse.de:email];
 DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, 6 Mar 2025 16:18:07 +0800, Chao Yu wrote: > export
 F2FS_INJECT_PROG w/ inject.f2fs, it can be used for fault injection. > >
 Cc: Jaegeuk Kim <jaegeuk@kernel.org> > Signed-off-by: Chao Yu
 <chao@kernel.org> > --- > common/config | 1 + > 1 file c [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
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
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.223.130 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1tqOpz-0000vp-OT
Subject: Re: [f2fs-dev] [PATCH 2/4] common/config: export F2FS_INJECT_PROG
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

On Thu,  6 Mar 2025 16:18:07 +0800, Chao Yu wrote:

> export F2FS_INJECT_PROG w/ inject.f2fs, it can be used for fault injection.
> 
> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  common/config | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/common/config b/common/config
> index 8d3047a5..05f192ea 100644
> --- a/common/config
> +++ b/common/config
> @@ -317,6 +317,7 @@ export MKFS_BTRFS_PROG=$(set_mkfs_prog_path_with_opts btrfs)
>  export MKFS_F2FS_PROG=$(set_mkfs_prog_path_with_opts f2fs)
>  export DUMP_F2FS_PROG=$(type -P dump.f2fs)
>  export F2FS_IO_PROG=$(type -P f2fs_io)
> +export F2FS_INJECT_PROG=$(type -P inject.f2fs)
>  export BTRFS_UTIL_PROG=$(type -P btrfs)
>  export BTRFS_SHOW_SUPER_PROG=$(type -P btrfs-show-super)
>  export BTRFS_CONVERT_PROG=$(type -P btrfs-convert)

Reviewed-by: David Disseldorp <ddiss@suse.de>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
