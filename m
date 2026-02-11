Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ABCWLIVcjGmWlwAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Feb 2026 11:40:05 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E902E12380F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Feb 2026 11:40:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Ro7pHXW6gOYaUdcSoG0km1k/LMT4paD36rdD/Thf30=; b=fH44piHuEURW2JAYShNaH1/ZLK
	DL2VYsOE++OCgsPhLCC579Adxu4kFtUPwzENrG5YfZ7rZfcle7+pDcv6vy++svCRMKrDU8yOi/T+P
	UWq18fR2Zs9yx7/YOgo8J98Cecw19ZoXBzqLFtMryLtO46PVZwObtfP2Aj57qY9oNfkU=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vq7dQ-0003Y6-3v;
	Wed, 11 Feb 2026 10:39:52 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jack@suse.cz>) id 1vq7dO-0003Xv-Rt
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Feb 2026 10:39:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=y76NacrGFKNA67jm3GBX5fGDdHrRzA908Y/YQr7KcHE=; b=JKbhR2zlvQKrRzOJEF6OG9kUa+
 z/+vYe/f7I4ETGKSjkqweMHDCRhYqTtSGAM1AVwjIsXxwPIriJGGqIFRLZ85jZVAT1G+Naqs+BVNt
 GdG4uSh91pk+vwbzESX8t/gIiywgEyr5iLM1JAGIWVTExlQc1HBuz8XCn9GQ3vVpGwek=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=y76NacrGFKNA67jm3GBX5fGDdHrRzA908Y/YQr7KcHE=; b=BxXdGrkYtO9ojbCV93pvyaiflP
 npjB0L3/RGo+Z19Ueoa5yW1DT9IBXazF9RpPZf5Js6JacUBr1CQrb/wXSwTmOG4ZxW8c/s1PnY0C3
 gS0wD+xRcpO6GExz2RbUf9bzizcvIN0GIsUZEI5uVCsnXKRdN8IPm8U9Uss087ll7o2o=;
Received: from smtp-out2.suse.de ([195.135.223.131])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vq7dO-0002R9-NI for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Feb 2026 10:39:51 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E03665BD05;
 Wed, 11 Feb 2026 10:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1770806379; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=y76NacrGFKNA67jm3GBX5fGDdHrRzA908Y/YQr7KcHE=;
 b=BmUBboYWPK+YFbU/jweWKyIiUAweeNXYSTX1fb3ioA82XPtGMDyhfkU7hzRjYdDX6yjo6X
 BeUu5WcFU45hHpGE8oPLjrvZRt0V32MUGIHUsf8pNtCt64kKmLgOKjpmy7+EBfzWu7XdN3
 zOKg6uHuRlpSN5eZ+sXnL3mQN4S9nng=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1770806379;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=y76NacrGFKNA67jm3GBX5fGDdHrRzA908Y/YQr7KcHE=;
 b=by39V2THiRrSEIe+rir0v6aSPkDRc8KCONGaVuv9Nts2jJFfk8kzHZO3UTQCF0EaA+Cnxj
 64QImSNnfLUywxCg==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=0Qfw5mJC;
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b="z/UMqHF7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1770806378; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=y76NacrGFKNA67jm3GBX5fGDdHrRzA908Y/YQr7KcHE=;
 b=0Qfw5mJCxxyf0ABiPJVAehjEN8j26xUmtsMN3J935cFGujMLU634JBTrpXQag2QG8iDRxl
 6140cVo5sZHQtw7vwGlIlhM8/babUB9qURsDOMS4RnS5VMC+Zqi6b/OKTqtXLAvDfPZdEp
 REvU2t1zZz7PT+8lMhAC5x6DUP/OvpE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1770806378;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=y76NacrGFKNA67jm3GBX5fGDdHrRzA908Y/YQr7KcHE=;
 b=z/UMqHF7kR5+32lfphNTIcisbuVsCE222LlnL3EjP+ih0t7xz7nIVSqi+Rl/Ir7ySjNauZ
 CybE1xdlTiN0TvCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C9D7113A95;
 Wed, 11 Feb 2026 10:39:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id SexBMWpcjGnGMAAAD6G6ig
 (envelope-from <jack@suse.cz>); Wed, 11 Feb 2026 10:39:38 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 8F98AA0A4E; Wed, 11 Feb 2026 11:39:30 +0100 (CET)
Date: Wed, 11 Feb 2026 11:39:30 +0100
From: Jan Kara <jack@suse.cz>
To: Kundan Kumar <kundan.kumar@samsung.com>
Message-ID: <ddx62wlkv6hjirl5kf3szghllvgfkmrhp226bj3lxklskdyk6i@k3spugopk5rl>
References: <20260211070057.22001-1-kundan.kumar@samsung.com>
 <CGME20260211070537epcas5p11bcbdc3d5ab68e1b9b7ec68feda22487@epcas5p1.samsung.com>
 <20260211070057.22001-2-kundan.kumar@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260211070057.22001-2-kundan.kumar@samsung.com>
X-Spam-Score: -4.01
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed 11-02-26 12:30:54, Kundan Kumar wrote: > Add helper
 APIs needed by filesystems to avoid poking into writeback > internals. >
 > Suggested-by: Christoph Hellwig <hch@lst.de> > Signed-off-by: Kund [...]
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1vq7dO-0002R9-NI
Subject: Re: [f2fs-dev] [PATCH 1/4] writeback: prep helpers for dirty-limit
 and writeback accounting
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
Cc: brauner@kernel.org, jack@suse.cz, agruenba@redhat.com,
 pankaj.raghav@linux.dev, djwong@kernel.org, anuj20.g@samsung.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 gfs2@lists.linux.dev, mcgrof@kernel.org, viro@zeniv.linux.org.uk,
 anna@kernel.org, gost.dev@samsung.com, jaegeuk@kernel.org,
 vishak.g@samsung.com, linux-nfs@vger.kernel.org, hch@lst.de,
 trondmy@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.21 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:email,samsung.com:email,suse.com:email,lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim];
	FORGED_RECIPIENTS(0.00)[m:kundan.kumar@samsung.com,m:brauner@kernel.org,m:jack@suse.cz,m:agruenba@redhat.com,m:pankaj.raghav@linux.dev,m:djwong@kernel.org,m:anuj20.g@samsung.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:gfs2@lists.linux.dev,m:mcgrof@kernel.org,m:viro@zeniv.linux.org.uk,m:anna@kernel.org,m:gost.dev@samsung.com,m:jaegeuk@kernel.org,m:vishak.g@samsung.com,m:linux-nfs@vger.kernel.org,m:hch@lst.de,m:trondmy@kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_NA(0.00)[suse.cz];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jack@suse.cz,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,suse.cz:-];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jack@suse.cz,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E902E12380F
X-Rspamd-Action: no action

On Wed 11-02-26 12:30:54, Kundan Kumar wrote:
> Add helper APIs needed by filesystems to avoid poking into writeback
> internals.
> 
> Suggested-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Kundan Kumar <kundan.kumar@samsung.com>
> Signed-off-by: Anuj Gupta <anuj20.g@samsung.com>

Looks sensible. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  include/linux/backing-dev.h | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/include/linux/backing-dev.h b/include/linux/backing-dev.h
> index 0c8342747cab..4165ad3ddf00 100644
> --- a/include/linux/backing-dev.h
> +++ b/include/linux/backing-dev.h
> @@ -78,6 +78,17 @@ static inline s64 wb_stat_sum(struct bdi_writeback *wb, enum wb_stat_item item)
>  
>  extern void wb_writeout_inc(struct bdi_writeback *wb);
>  
> +static inline int bdi_wb_dirty_exceeded(struct backing_dev_info *bdi)
> +{
> +	return bdi->wb.dirty_exceeded;
> +}
> +
> +static inline void bdi_wb_stat_mod(struct backing_dev_info *bdi,
> +				   enum wb_stat_item item, s64 amount)
> +{
> +	wb_stat_mod(&bdi->wb, item, amount);
> +}
> +
>  /*
>   * maximal error of a stat counter.
>   */
> -- 
> 2.25.1
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
