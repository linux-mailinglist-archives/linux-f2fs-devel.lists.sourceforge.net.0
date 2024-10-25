Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D949B0C1F
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 25 Oct 2024 19:50:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t4OS1-0001Px-2p;
	Fri, 25 Oct 2024 17:50:16 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dsterba@suse.cz>) id 1t4ORz-0001Pn-RF
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Oct 2024 17:50:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=faWa8hUjhNnXYbB3wXK4vm2P4aNOrVk6VtNX9UfmEFk=; b=T+7n0f5C8LY/8QPOu+d5VXRanb
 Gw8Wrz0YzxaqZ8bx8nE1QwJXspiy+WskldhbAMOVe9JUd4BEGx23DjTkS+eLsYbjTC89/ZMAmOgHr
 bVb14k/6u2CHfHQtzhh6eG/ghy3QbTfVYKm8LDXi+jXaspFrlpX+aiTHWRIHbmMUbUGM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Reply-To:Message-ID:
 Subject:Cc:To:From:Date:Sender:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=faWa8hUjhNnXYbB3wXK4vm2P4aNOrVk6VtNX9UfmEFk=; b=ORSOh3JEr8IDOCPmPBpZhiIHd1
 +un+qmG2vbz9dXlIP67SeoezxC4X8hITIPRfHMR4CZy9IOAOS2QJ+VqvTcOpOY3ZH0T+cVRNCuLK9
 31ej+yMT77Zk3gTkk6STAJ2PcRPDKNVJFBO/7mKzEh3O0JiZbSf9aPEq2/U8QYw0BWe8=;
Received: from smtp-out2.suse.de ([195.135.223.131])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1t4ORx-0006E6-2P for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Oct 2024 17:50:15 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8B7D01F7F9;
 Fri, 25 Oct 2024 17:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1729878601;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=faWa8hUjhNnXYbB3wXK4vm2P4aNOrVk6VtNX9UfmEFk=;
 b=ownTWJ9Lf5ejQQeGvycmodvURhMx88ltENj8SXBaltoPWz5ulsWweH7l8zDR1HzTg8S9+7
 BnTvjo7UW2XcgI1WQ26txumnQv6mDwliAU6xz5sy6S55/sySF+7cVRe28itJ3VauFMkDn5
 icbdKT9T+SjjnkG9eNm9GGVnZx5TgpA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1729878601;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=faWa8hUjhNnXYbB3wXK4vm2P4aNOrVk6VtNX9UfmEFk=;
 b=0VCK8/x2s1IpBCmfQqktzy6zLz7X+8fonFoj20qID/JA+o1WoGI/PnKUYhJAWOILdrlKYu
 wu99lT5t354oU7Dg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1729878601;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=faWa8hUjhNnXYbB3wXK4vm2P4aNOrVk6VtNX9UfmEFk=;
 b=ownTWJ9Lf5ejQQeGvycmodvURhMx88ltENj8SXBaltoPWz5ulsWweH7l8zDR1HzTg8S9+7
 BnTvjo7UW2XcgI1WQ26txumnQv6mDwliAU6xz5sy6S55/sySF+7cVRe28itJ3VauFMkDn5
 icbdKT9T+SjjnkG9eNm9GGVnZx5TgpA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1729878601;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=faWa8hUjhNnXYbB3wXK4vm2P4aNOrVk6VtNX9UfmEFk=;
 b=0VCK8/x2s1IpBCmfQqktzy6zLz7X+8fonFoj20qID/JA+o1WoGI/PnKUYhJAWOILdrlKYu
 wu99lT5t354oU7Dg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 51B2D132D3;
 Fri, 25 Oct 2024 17:50:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 3LpvE0naG2deGwAAD6G6ig
 (envelope-from <dsterba@suse.cz>); Fri, 25 Oct 2024 17:50:01 +0000
Date: Fri, 25 Oct 2024 19:49:59 +0200
From: David Sterba <dsterba@suse.cz>
To: "Pankaj Raghav (Samsung)" <kernel@pankajraghav.com>
Message-ID: <20241025174959.GH31418@suse.cz>
References: <20240926140121.203821-1-kernel@pankajraghav.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240926140121.203821-1-kernel@pankajraghav.com>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 HAS_REPLYTO(0.30)[dsterba@suse.cz];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCPT_COUNT_TWELVE(0.00)[30];
 R_RATELIMIT(0.00)[to_ip_from(RL56wjrisuox4ztiyaq54br4m8)];
 MIME_TRACE(0.00)[0:+]; RCVD_VIA_SMTP_AUTH(0.00)[];
 ARC_NA(0.00)[]; TO_DN_SOME(0.00)[]; MID_RHS_MATCH_FROM(0.00)[];
 RCVD_TLS_ALL(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 REPLYTO_ADDR_EQ_FROM(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:replyto,suse.cz:mid,suse.com:email,samsung.com:email];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 REPLYTO_DOM_NEQ_TO_DOM(0.00)[]
X-Spam-Score: -4.00
X-Spam-Flag: NO
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Sep 26, 2024 at 04:01:21PM +0200,
 Pankaj Raghav (Samsung)
 wrote: > From: Pankaj Raghav <p.raghav@samsung.com> > > Most of the callers
 of wbc_account_cgroup_owner() are converting a folio > to [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.223.131 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1t4ORx-0006E6-2P
Subject: Re: [f2fs-dev] [PATCH] fs/writeback: convert
 wbc_account_cgroup_owner to take a folio
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
Cc: Jan Kara <jack@suse.cz>, linux-doc@vger.kernel.org,
 "Darrick J . Wong" <djwong@kernel.org>, Chris Mason <clm@fb.com>,
 Andreas Dilger <adilger.kernel@dilger.ca>, Zefan Li <lizefan.x@bytedance.com>,
 cgroups@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 gost.dev@samsung.com, willy@infradead.org, linux-ext4@vger.kernel.org,
 Pankaj Raghav <p.raghav@samsung.com>, Josef Bacik <josef@toxicpanda.com>,
 linux-fsdevel@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Christian Brauner <brauner@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, mcgrof@kernel.org,
 Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Tejun Heo <tj@kernel.org>,
 akpm@linux-foundation.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Sep 26, 2024 at 04:01:21PM +0200, Pankaj Raghav (Samsung) wrote:
> From: Pankaj Raghav <p.raghav@samsung.com>
> 
> Most of the callers of wbc_account_cgroup_owner() are converting a folio
> to page before calling the function. wbc_account_cgroup_owner() is
> converting the page back to a folio to call mem_cgroup_css_from_folio().
> 
> Convert wbc_account_cgroup_owner() to take a folio instead of a page,
> and convert all callers to pass a folio directly except f2fs.
> 
> Convert the page to folio for all the callers from f2fs as they were the
> only callers calling wbc_account_cgroup_owner() with a page. As f2fs is
> already in the process of converting to folios, these call sites might
> also soon be calling wbc_account_cgroup_owner() with a folio directly in
> the future.
> 
> No functional changes. Only compile tested.
> 
> Signed-off-by: Pankaj Raghav <p.raghav@samsung.com>
> ---
>  fs/btrfs/extent_io.c                    | 7 +++----
>  fs/btrfs/inode.c                        | 2 +-

If you ever want to continue with the conversion then for the btrfs part

Acked-by: David Sterba <dsterba@suse.com>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
