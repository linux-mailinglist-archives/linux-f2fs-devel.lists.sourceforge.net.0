Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DA038BF65BE
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 21 Oct 2025 14:12:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gG2/2rBMLUajuMaR9t28nDoSaG3AscY5pA8AwqpLeQs=; b=H9RvFTyXfDRdUYE9oMfsSNy175
	Q+Nz3JRTNUK49W8xsY1Nam91GGpvvQivVJH9I1XRVKK868JdinT+4wgqEBnuGjSoqN6qmNWLdOxiR
	SdWK1E68mbKLSj14CId+SZbsS8jGno/6+heAZM9B+qgsTLKGhJlKMnkEuBAsSc0y2M1U=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vBBDp-00062l-8L;
	Tue, 21 Oct 2025 12:12:13 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jack@suse.cz>) id 1vBBDo-00062d-0z
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 Oct 2025 12:12:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RwFREZndxsLQgEOojxw0ePiYGHl5h5o9l6t4QJAq490=; b=GgCaSKVfp0ew3KHzynREor+R1+
 co4QdVeQb63Sy00hxt68srEP0OyU2bAabeFsVMRJ6KgkAbhkmt1sN+SHWhXK+VeFLgJrN0f22CJcn
 8g7spIC8Jz/c8+1yIelfW5QmKWRJVyXTL7z+z4ocpNvnsCl5+7HbmEJg1o6uo3/j5IIQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RwFREZndxsLQgEOojxw0ePiYGHl5h5o9l6t4QJAq490=; b=aU6wA35N4mrsivEFmffGRGiZCM
 mShYItximWgV4yW98CmU4pP6H51OE6469fbF9DqKM2fAb6lmpZMZsLzP9cH+5l0qjEvZb3Ocj5uyK
 BSCCoiQZq0sRbhTSADzl/0KrOcTm8uT54BtpLneOWEL0Fg8cDfMkZJq9wMmapBygP/Ak=;
Received: from smtp-out2.suse.de ([195.135.223.131])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vBBDn-0005D5-GU for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 Oct 2025 12:12:11 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DFCB61F449;
 Tue, 21 Oct 2025 12:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1761048716; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RwFREZndxsLQgEOojxw0ePiYGHl5h5o9l6t4QJAq490=;
 b=1At4+x7RUQX3DhyB+qyxSOIRvgZOdQDNb7FGLNTIAPVEHvE16pzIodPz9SZb5n++keS4hC
 ETbw7DLdFE9/ZWUCZufVR68+CMYqESgc7VnA+PfTni1W6+P+y2MFUOR8eGpWy8XmXKbRRg
 sGgLNDoe+JWyCItjD1f5DC9ldUdkq0c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1761048716;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RwFREZndxsLQgEOojxw0ePiYGHl5h5o9l6t4QJAq490=;
 b=5zWlszzICLEmgZyDBbbLJfNDAG3GGDOTSvp3RGR9rZ3qNfZ+iwMKswINJWZ73qbk6aamz+
 kG5TvvaQGZGJBVDA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1761048711; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RwFREZndxsLQgEOojxw0ePiYGHl5h5o9l6t4QJAq490=;
 b=BxLuJ7psEhbrdLUyRYzObCBehqf5I73VS69CwdWanYIV+F4T1CcQv2fTKB+m/0ryGctw8/
 G7rAwn50A+PF6Ci56o+PmZEWVDwANKAU2dJ/XnnmPQb91tQjKvUaLlcReW+dJY/st4uHY4
 QVWgtOqzbwkq0rqZRUwFpFIF2MChLXM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1761048711;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RwFREZndxsLQgEOojxw0ePiYGHl5h5o9l6t4QJAq490=;
 b=sLWuz3DITIDFEo2otIwSc54F2tb8TtJXbMNwWElucdMWEjlkuTF9VhSRmGK3Wr7g/OaS2J
 bJx2o3ShC4GOYPDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D1658139D8;
 Tue, 21 Oct 2025 12:11:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id ccUdM4d492iSaAAAD6G6ig
 (envelope-from <jack@suse.cz>); Tue, 21 Oct 2025 12:11:51 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 6211BA0990; Tue, 21 Oct 2025 14:11:47 +0200 (CEST)
Date: Tue, 21 Oct 2025 14:11:47 +0200
From: Jan Kara <jack@suse.cz>
To: Kundan Kumar <kundan.kumar@samsung.com>
Message-ID: <bfpv6jrjo4avzk76ex77dwpzaejglu5gsf2pqpmmgwrmqdkkk3@imsbtnrcelee>
References: <CGME20251014120958epcas5p267c3c9f9dbe6ffc53c25755327de89f9@epcas5p2.samsung.com>
 <20251014120845.2361-1-kundan.kumar@samsung.com>
 <aPa7xozr7YbZX0W4@dread.disaster.area>
 <6fe26b74-beb9-4a6a-93af-86edcbde7b68@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6fe26b74-beb9-4a6a-93af-86edcbde7b68@samsung.com>
X-Spamd-Result: default: False [-2.30 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 MID_RHS_NOT_FQDN(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; RCVD_VIA_SMTP_AUTH(0.00)[];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+]; TO_DN_SOME(0.00)[];
 MISSING_XM_UA(0.00)[]; RCPT_COUNT_TWELVE(0.00)[31];
 TAGGED_RCPT(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 R_RATELIMIT(0.00)[to_ip_from(RLkd9wktknm683nrx6wbi4qz63)];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_CC(0.00)[fromorbit.com,kernel.org,zeniv.linux.org.uk,suse.cz,szeredi.hu,redhat.com,linux-foundation.org,infradead.org,meta.com,gmail.com,kernel.dk,lst.de,stgolabs.net,vivo.com,lists.sourceforge.net,vger.kernel.org,lists.linux.dev,kvack.org,samsung.com];
 RCVD_COUNT_THREE(0.00)[3]; FROM_EQ_ENVFROM(0.00)[];
 RCVD_TLS_LAST(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:email]
X-Spam-Flag: NO
X-Spam-Score: -2.30
X-Spam-Level: 
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue 21-10-25 16:06:22,
 Kundan Kumar wrote: > Previous results
 of fragmentation were taken with randwrite. I took > fresh data for sequential
 IO and here are the results. > number of extents reduces [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1vBBDn-0005D5-GU
Subject: Re: [f2fs-dev] [PATCH v2 00/16] Parallelizing filesystem writeback
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
Cc: ritesh.list@gmail.com, vishak.g@samsung.com, jack@suse.cz,
 djwong@kernel.org, amir73il@gmail.com, Dave Chinner <david@fromorbit.com>,
 gfs2@lists.linux.dev, linux-mm@kvack.org, clm@meta.com, hch@lst.de,
 dave@stgolabs.net, agruenba@redhat.com, miklos@szeredi.hu,
 gost.dev@samsung.com, willy@infradead.org, anuj20.g@samsung.com,
 linux-nfs@vger.kernel.org, viro@zeniv.linux.org.uk, jaegeuk@kernel.org,
 axboe@kernel.dk, brauner@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 mcgrof@kernel.org, anna@kernel.org, linux-fsdevel@vger.kernel.org,
 akpm@linux-foundation.org, trondmy@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue 21-10-25 16:06:22, Kundan Kumar wrote:
> Previous results of fragmentation were taken with randwrite. I took
> fresh data for sequential IO and here are the results.
> number of extents reduces a lot for seq IO:
>    A) Workload 6 files each 1G in single directory(AG)   - numjobs = 1
>          Base XFS                : 1
>          Parallel Writeback XFS  : 1
> 
>    B) Workload 12 files each of 1G to 12 directories(AGs)- numjobs = 12
>          Base XFS                : 4
>          Parallel Writeback XFS  : 3
> 
>    C) Workload 6 files each of 20G to 6 directories(AGs) - numjobs = 6
>          Base XFS                : 4
>          Parallel Writeback XFS  : 4

Thanks for sharing details! I'm curious: how big differences in throughput
did you see between normal and parallel writeback with sequential writes?

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
