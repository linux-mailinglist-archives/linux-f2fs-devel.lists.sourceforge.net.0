Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B52D2FD08
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 16 Jan 2026 11:48:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7rzLuw7UOEd05SfDB2f5Z99kYZpIo+Di181O+4g4IUk=; b=EGZEAThV8otlINeuasyRXXeg7W
	9jRbdg3lThnNNPpe1pIQCdDGlNkk4SQ/KPtGVSmY02/8W4pVxhAJQvrTiK8IZpYhaEEE8rxiKGBD9
	v2RnKWW0uLMt2EVCoyCNl2dgYB7Y+Ul+u/XDS3wmYRXN4zVCtpCD6z5BBjEW+hTY6myU=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vghN5-0008GN-5L;
	Fri, 16 Jan 2026 10:48:03 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jack@suse.cz>) id 1vghN2-0008Fv-Th
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 16 Jan 2026 10:48:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Sxv0JM+Kl8CyBCRTXuvFgjvy4sy6WbuKYSBt+sEG264=; b=TMwR4pyAWKwdda57/DhzIt8/4q
 auLeZEj0r7rSIoDt1SHxm65dPDCfGYk+WM6OBqJWN/gY1I3W58PXz8gLS8f7fQoFmRcZ802CaLFrc
 DGPM5i7aPtVJ7kH2trzM5djp4CI4hQIBdBkCw64o+CB/lrvFqRrntLDIAoG/RPE3tSC4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Sxv0JM+Kl8CyBCRTXuvFgjvy4sy6WbuKYSBt+sEG264=; b=JGJV/o4HM2ed1A1xbSXmqnUY2s
 A42h8SJhsgg2lL1a9uChBz3u+b6/nnPaQeOiXet4bhIQ1zFcv9eHNV3hlCMji9Lyc8k1AFFQUpUDK
 hG6bbMGFS0TECAbHVWa445hkGzyktvYi0TLvwAXrhI2/Bw6XAi+h9EY9AK6IkDigwCrA=;
Received: from smtp-out1.suse.de ([195.135.223.130])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vghN2-0007To-8y for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 16 Jan 2026 10:48:00 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E9DC4336BA;
 Fri, 16 Jan 2026 10:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1768560469; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Sxv0JM+Kl8CyBCRTXuvFgjvy4sy6WbuKYSBt+sEG264=;
 b=NAigHHJefgDlX6mRySbG7B5iCmL36aEduQNmXj2EvsoYBrU7/VTo8/WNZrc+jBxVmYwek3
 innlofjWnNur4gO64jxDUWQVk3pm53xXSuys1aTGTWpFtvR1Xd4ONEVhhk+B034xGJPlVB
 qicHNvV2T2n+PsShv1UvN/CV4roIDw8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1768560469;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Sxv0JM+Kl8CyBCRTXuvFgjvy4sy6WbuKYSBt+sEG264=;
 b=wAaeVaZXVSmCCp/Ci8z3PCyFT3ubSWVNcMQNxpoFpxosJZqqzSMYJQTVEe91z3AbyBwRES
 hgYeQWFl3/XVwuCg==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=Vqd1Y4ym;
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=7Gjt5tLm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1768560468; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Sxv0JM+Kl8CyBCRTXuvFgjvy4sy6WbuKYSBt+sEG264=;
 b=Vqd1Y4ymZFbiTB3W7/+krX5l7W5sxL7aNuHpBkJYaPRDypTZKpWZDKux+L+iC/0RWALCc4
 Wl+guT58YT9lXH7G1B0VaMoNprxzvexhqTpUZyuh7OzKnAPdgG0Xbfk0EUDTxkORMoIq4Q
 yoxjYuhlhqs/kbTHf/h7VyrYgdeD378=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1768560468;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Sxv0JM+Kl8CyBCRTXuvFgjvy4sy6WbuKYSBt+sEG264=;
 b=7Gjt5tLmv8pwoPI4+tAhdd+IkW9SPQOahLPixnGtYy+H9R2r0zQYbKm8w1G8zq15sjbdtX
 okoOuMG52JxjWaBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DAAB63EA63;
 Fri, 16 Jan 2026 10:47:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id JhtdNVQXamm8DAAAD6G6ig
 (envelope-from <jack@suse.cz>); Fri, 16 Jan 2026 10:47:48 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id A1819A091D; Fri, 16 Jan 2026 11:47:48 +0100 (CET)
Date: Fri, 16 Jan 2026 11:47:48 +0100
From: Jan Kara <jack@suse.cz>
To: Jeff Layton <jlayton@kernel.org>
Message-ID: <7ez6obuswq26r3fi5es44rv25motvmcc7iuv7mpj7s2cnb4i4i@di4z7eug36t7>
References: <20260115-exportfs-nfsd-v1-0-8e80160e3c0c@kernel.org>
 <20260115-exportfs-nfsd-v1-18-8e80160e3c0c@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260115-exportfs-nfsd-v1-18-8e80160e3c0c@kernel.org>
X-Spam-Score: -2.51
X-Spamd-Result: default: False [-2.51 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 MID_RHS_NOT_FQDN(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; RCVD_TLS_LAST(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; RCVD_COUNT_THREE(0.00)[3];
 MIME_TRACE(0.00)[0:+];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 ARC_NA(0.00)[]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 FREEMAIL_CC(0.00)[kernel.org,zeniv.linux.org.uk,oracle.com,brown.name,redhat.com,talpey.com,gmail.com,google.com,linux.alibaba.com,linux-foundation.org,mit.edu,dilger.ca,suse.com,huawei.com,vivo.com,dubeyko.com,fb.com,squashfs.org.uk,samba.org,manguebit.org,microsoft.com,szeredi.hu,omnibond.com,fasheh.com,evilplan.org,paragon-software.com,infradead.org,nod.at,suse.cz,mail.parknet.co.jp,vger.kernel.org,kvack.org,lists.ozlabs.org,lists.samba.org,lists.orangefs.org,lists.linux.dev,lists.sourceforge.net,lists.infradead.org];
 DKIM_TRACE(0.00)[suse.cz:+];
 R_RATELIMIT(0.00)[to_ip_from(RLpnapcpkwxdkc5mopt1ezhhna)];
 TO_MATCH_ENVRCPT_SOME(0.00)[];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCPT_COUNT_GT_50(0.00)[74];
 TAGGED_RCPT(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 MISSING_XM_UA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,
 imap1.dmz-prg2.suse.org:helo, suse.cz:dkim, suse.cz:email, suse.com:email]
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: E9DC4336BA
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu 15-01-26 12:47:49,
 Jeff Layton wrote: > Add the EXPORT_OP_STABLE_HANDLES
 flag to ocfs2 export operations to indicate > that this filesystem can be
 exported via NFS. > > Signed-off-by: Jeff Layt [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1vghN2-0007To-8y
Subject: Re: [f2fs-dev] [PATCH 18/29] ocfs2: add EXPORT_OP_STABLE_HANDLES
 flag to export operations
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
Cc: Martin Brandenburg <martin@omnibond.com>,
 jfs-discussion@lists.sourceforge.net, Jan Kara <jack@suse.cz>,
 Paulo Alcantara <pc@manguebit.org>, Alex Markuze <amarkuze@redhat.com>,
 Sandeep Dhavale <dhavale@google.com>, linux-btrfs@vger.kernel.org,
 Carlos Maiolino <cem@kernel.org>, Amir Goldstein <amir73il@gmail.com>,
 linux-unionfs@vger.kernel.org,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Chris Mason <clm@fb.com>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Chunhai Guo <guochunhai@vivo.com>, Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 linux-mtd@lists.infradead.org, Mike Marshall <hubcap@omnibond.com>,
 linux-xfs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 Yue Hu <zbestahu@gmail.com>, Miklos Szeredi <miklos@szeredi.hu>,
 Richard Weinberger <richard@nod.at>, Mark Fasheh <mark@fasheh.com>,
 Hugh Dickins <hughd@google.com>, Dai Ngo <Dai.Ngo@oracle.com>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 Christoph Hellwig <hch@infradead.org>, Viacheslav Dubeyko <slava@dubeyko.com>,
 NeilBrown <neil@brown.name>, Gao Xiang <xiang@kernel.org>,
 linux-ext4@vger.kernel.org, Salah Triki <salah.triki@gmail.com>,
 linux-mm@kvack.org, devel@lists.orangefs.org,
 Shyam Prasad N <sprasad@microsoft.com>,
 Olga Kornievskaia <okorniev@redhat.com>, linux-cifs@vger.kernel.org,
 Dave Kleikamp <shaggy@kernel.org>, linux-nfs@vger.kernel.org,
 Tom Talpey <tom@talpey.com>, ocfs2-devel@lists.linux.dev,
 Bharath SM <bharathsm@microsoft.com>, David Sterba <dsterba@suse.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Jeffle Xu <jefflexu@linux.alibaba.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Ilya Dryomov <idryomov@gmail.com>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 Andreas Gruenbacher <agruenba@redhat.com>, gfs2@lists.linux.dev,
 Christian Brauner <brauner@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
 Luis de Bethencourt <luisbg@kernel.org>,
 Joseph Qi <joseph.qi@linux.alibaba.com>, linux-erofs@lists.ozlabs.org,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Steve French <sfrench@samba.org>,
 Chuck Lever <chuck.lever@oracle.com>, Hongbo Li <lihongbo22@huawei.com>,
 Anna Schumaker <anna@kernel.org>, Jan Kara <jack@suse.com>,
 linux-fsdevel@vger.kernel.org, Phillip Lougher <phillip@squashfs.org.uk>,
 Andrew Morton <akpm@linux-foundation.org>, ntfs3@lists.linux.dev,
 David Woodhouse <dwmw2@infradead.org>, Trond Myklebust <trondmy@kernel.org>,
 Joel Becker <jlbec@evilplan.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu 15-01-26 12:47:49, Jeff Layton wrote:
> Add the EXPORT_OP_STABLE_HANDLES flag to ocfs2 export operations to indicate
> that this filesystem can be exported via NFS.
> 
> Signed-off-by: Jeff Layton <jlayton@kernel.org>

Looks good. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/ocfs2/export.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/fs/ocfs2/export.c b/fs/ocfs2/export.c
> index b95724b767e150e991ae4b8ea5d0505c1ae95984..77d82ff994c86037c14fbf7a1d9706f1dd2b87ac 100644
> --- a/fs/ocfs2/export.c
> +++ b/fs/ocfs2/export.c
> @@ -280,4 +280,5 @@ const struct export_operations ocfs2_export_ops = {
>  	.fh_to_dentry	= ocfs2_fh_to_dentry,
>  	.fh_to_parent	= ocfs2_fh_to_parent,
>  	.get_parent	= ocfs2_get_parent,
> +	.flags		= EXPORT_OP_STABLE_HANDLES,
>  };
> 
> -- 
> 2.52.0
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
