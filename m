Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B01C843786
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 31 Jan 2024 08:16:49 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rV4po-0002bp-Uq;
	Wed, 31 Jan 2024 07:16:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dsterba@suse.cz>) id 1rV4pk-0002bL-6z
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 31 Jan 2024 07:16:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Z4HlIsuTjaT6ShV/XWd2YqSGY1ibQ0YmFqd6/vwPszQ=; b=RHbbnUnWTlWXm/oawNYR43kNxP
 KLei9B5e6I7cjmjOz906JQia34MWEEfYS01krE3MYjqtGFN/oO9A9sy4HRk6y/zGsAB7w+SGb77s3
 4l2Gf3P+TUwjpG1DveU+X54tk35NXg+PQHYBZ5QsYVhqd5PwjIBoC+DQZOeyZuMogIhM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Reply-To:Message-ID:
 Subject:Cc:To:From:Date:Sender:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Z4HlIsuTjaT6ShV/XWd2YqSGY1ibQ0YmFqd6/vwPszQ=; b=Q0gzcFYxpHXmR1UOdjGKLjZVtH
 MU/vJj7WFLiELmoIcmN+8ECyhDhArJ1Np0g/ysJkp2gB7B58001Xuuy7rGWyhfxEQsgWAHT7jLN3m
 1YdtVv0KTa5j5Y8MYQz1JHqywGPaJSh0lBx2jO8i7DEI2yAhJdlKive8M2N4X5QyjE1E=;
Received: from smtp-out2.suse.de ([195.135.223.131])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rV4pf-0002sf-Df for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 31 Jan 2024 07:16:32 +0000
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5424F1FB61;
 Wed, 31 Jan 2024 07:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1706685376;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z4HlIsuTjaT6ShV/XWd2YqSGY1ibQ0YmFqd6/vwPszQ=;
 b=Dr0NX+K2Wknc8HgmFJF3WsrkTyljOT0VAhD/if9Gwc6eh1skfoDnd2fNqoti8+OFa38FwW
 F++yDJEwFNzPkX17r3T1CqPb/q6vwya3tKTvpp3ruZwnDEeGdH2XdVDut18txQqCr4yG3g
 59F/vV7RqXHLsM/qAHvc0pwiDu1Qw3U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1706685376;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z4HlIsuTjaT6ShV/XWd2YqSGY1ibQ0YmFqd6/vwPszQ=;
 b=M92LB/4twMJGsx5maaY2j8FfPx3WEVqWrj7763vlJZHtVPWrLGgEYg6whL8WY/k4oSjmxD
 yNkkkd+RgIlsblCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1706685376;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z4HlIsuTjaT6ShV/XWd2YqSGY1ibQ0YmFqd6/vwPszQ=;
 b=Dr0NX+K2Wknc8HgmFJF3WsrkTyljOT0VAhD/if9Gwc6eh1skfoDnd2fNqoti8+OFa38FwW
 F++yDJEwFNzPkX17r3T1CqPb/q6vwya3tKTvpp3ruZwnDEeGdH2XdVDut18txQqCr4yG3g
 59F/vV7RqXHLsM/qAHvc0pwiDu1Qw3U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1706685376;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z4HlIsuTjaT6ShV/XWd2YqSGY1ibQ0YmFqd6/vwPszQ=;
 b=M92LB/4twMJGsx5maaY2j8FfPx3WEVqWrj7763vlJZHtVPWrLGgEYg6whL8WY/k4oSjmxD
 yNkkkd+RgIlsblCg==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 1E743132FA;
 Wed, 31 Jan 2024 07:16:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id mnPhBsDzuWV0CQAAn2gu4w
 (envelope-from <dsterba@suse.cz>); Wed, 31 Jan 2024 07:16:16 +0000
Date: Wed, 31 Jan 2024 08:15:50 +0100
From: David Sterba <dsterba@suse.cz>
To: Johannes Thumshirn <johannes.thumshirn@wdc.com>
Message-ID: <20240131071550.GI31555@twin.jikos.cz>
References: <20240128-zonefs_nofs-v3-0-ae3b7c8def61@wdc.com>
 <20240128-zonefs_nofs-v3-3-ae3b7c8def61@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240128-zonefs_nofs-v3-3-ae3b7c8def61@wdc.com>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=Dr0NX+K2;
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b="M92LB/4t"
X-Spamd-Result: default: False [-1.35 / 50.00]; ARC_NA(0.00)[];
 HAS_REPLYTO(0.30)[dsterba@suse.cz];
 R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_GOOD(-0.10)[text/plain]; REPLYTO_ADDR_EQ_FROM(0.00)[];
 RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.cz:+]; MX_GOOD(-0.01)[];
 RCPT_COUNT_TWELVE(0.00)[23];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.cz:dkim];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[];
 BAYES_HAM(-1.34)[90.40%]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 5424F1FB61
X-Spam-Level: 
X-Spam-Score: -1.35
X-Spam-Flag: NO
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sun, Jan 28, 2024 at 11:52:18PM -0800, Johannes Thumshirn
 wrote: > Add a memalloc_nofs scope around all calls to blkdev_zone_mgmt().
 This > allows us to further get rid of the GFP_NOFS argument for [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.223.131 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rV4pf-0002sf-Df
Subject: Re: [f2fs-dev] [PATCH v3 3/5] btrfs: zoned: call blkdev_zone_mgmt
 in nofs scope
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
Reply-To: dsterba@suse.cz
Cc: linux-nvme@lists.infradead.org, Chris Mason <clm@fb.com>,
 Christoph Hellwig <hch@lst.de>, Alasdair Kergon <agk@redhat.com>,
 Naohiro Aota <naohiro.aota@wdc.com>, Sagi Grimberg <sagi@grimberg.me>,
 dm-devel@lists.linux.dev, Chaitanya Kulkarni <kch@nvidia.com>,
 Mike Snitzer <snitzer@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
 linux-block@vger.kernel.org, Damien Le Moal <dlemoal@kernel.org>,
 Mikulas Patocka <mpatocka@redhat.com>, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, Johannes Thumshirn <jth@kernel.org>,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sun, Jan 28, 2024 at 11:52:18PM -0800, Johannes Thumshirn wrote:
> Add a memalloc_nofs scope around all calls to blkdev_zone_mgmt(). This
> allows us to further get rid of the GFP_NOFS argument for
> blkdev_zone_mgmt().
> 
> Signed-off-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>

Reviewed-by: David Sterba <dsterba@suse.com>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
