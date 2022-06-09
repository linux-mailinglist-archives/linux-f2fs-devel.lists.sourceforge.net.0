Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F16BA54521D
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  9 Jun 2022 18:38:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nzLAZ-0004e5-SM; Thu, 09 Jun 2022 16:38:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <dsterba@suse.cz>)
 id 1nzLAY-0004dv-BY; Thu, 09 Jun 2022 16:38:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zfYT+PR9lXha9hYJlMd2oONaI1SUc3WGC1Bck/G8ec0=; b=PrWtS9J/UjVyjQ5qtKvwnl20b7
 LvDZ6nRv2ewaPHR9Cvf+W+Mq/LwTY0w2dqSaFnYMGaFXIpBIk5fHbDqRd7CYTAQaR6uYKLJCDrGAT
 7opfkgfJ7m/n3TiyN4S3L1bGfMN+O09/VEQmiTJ0xdz1uTGwNv2dlg2hLsLZEO+eBcwA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Reply-To:Message-ID:
 Subject:Cc:To:From:Date:Sender:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zfYT+PR9lXha9hYJlMd2oONaI1SUc3WGC1Bck/G8ec0=; b=nHICYNXr907VYdDYyKR4w8LIfH
 mO4Kkq8L/ncLpLNlSV4V2XujpD1i/DDB/r/lsan0QnrDgv3SOouE2g7aABkzwRPvgjMlyB60V9kbN
 sJ9cFzODbJ/Mp9nf2m8PTX3lUqDIfCDwyhww6WqN4CTyvkx39q82BWLCCCdkGoJXZflI=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nzLAV-0001tn-H2; Thu, 09 Jun 2022 16:38:02 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 65EBB1FECD;
 Thu,  9 Jun 2022 16:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1654792674;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zfYT+PR9lXha9hYJlMd2oONaI1SUc3WGC1Bck/G8ec0=;
 b=b2KEX6ZCINZeKoHTynlrz3FMDUbnVbIkotULQQM8wta+qakmo0wc5ILD3yfYynBGt8D1yz
 HYV/+JhfacH7KcZ34tTxnGAMq0+073DU9INO4NM3aBmmmH1cmHo9hWrrTnPyGWxZmapSer
 hIaGVqCWyAZ99ysi+fFP8RhgxxrPFtk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1654792674;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zfYT+PR9lXha9hYJlMd2oONaI1SUc3WGC1Bck/G8ec0=;
 b=Irv56z+I7t/5vmpdqARm0xsfrzoUND1o/lJUqjcW0uNId73f8zXP/st70yGmLiPVj3W5Qe
 j8Fgd9g+H7+p0iCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E9F2713A8C;
 Thu,  9 Jun 2022 16:37:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id sFfPN+EhomK4KAAAMHmgww
 (envelope-from <dsterba@suse.cz>); Thu, 09 Jun 2022 16:37:53 +0000
Date: Thu, 9 Jun 2022 18:33:23 +0200
From: David Sterba <dsterba@suse.cz>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Message-ID: <20220609163323.GV20633@twin.jikos.cz>
Mail-Followup-To: dsterba@suse.cz,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, linux-aio@kvack.org,
 linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
 linux-mm@kvack.org, linux-xfs@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-ntfs-dev@lists.sourceforge.net,
 ocfs2-devel@oss.oracle.com, linux-mtd@lists.infradead.org,
 virtualization@lists.linux-foundation.org,
 Christoph Hellwig <hch@lst.de>
References: <20220608150249.3033815-1-willy@infradead.org>
 <20220608150249.3033815-13-willy@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220608150249.3033815-13-willy@infradead.org>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Jun 08, 2022 at 04:02:42PM +0100,
 Matthew Wilcox (Oracle)
 wrote: > Use filemap_migrate_folio() to do the bulk of the work, and then
 copy > the ordered flag across if needed. > > Signed-off-by: [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.29 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nzLAV-0001tn-H2
Subject: Re: [f2fs-dev] [PATCH v2 12/19] btrfs: Convert btrfs_migratepage to
 migrate_folio
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
Cc: linux-aio@kvack.org, linux-nfs@vger.kernel.org, cluster-devel@redhat.com,
 linux-ntfs-dev@lists.sourceforge.net, Christoph Hellwig <hch@lst.de>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-block@vger.kernel.org, linux-mm@kvack.org, linux-mtd@lists.infradead.org,
 ocfs2-devel@oss.oracle.com, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-xfs@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Jun 08, 2022 at 04:02:42PM +0100, Matthew Wilcox (Oracle) wrote:
> Use filemap_migrate_folio() to do the bulk of the work, and then copy
> the ordered flag across if needed.
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> Reviewed-by: Christoph Hellwig <hch@lst.de>

Acked-by: David Sterba <dsterba@suse.com>

> +static int btrfs_migrate_folio(struct address_space *mapping,
> +			     struct folio *dst, struct folio *src,
>  			     enum migrate_mode mode)
>  {
> -	int ret;
> +	int ret = filemap_migrate_folio(mapping, dst, src, mode);
>  
> -	ret = migrate_page_move_mapping(mapping, newpage, page, 0);
>  	if (ret != MIGRATEPAGE_SUCCESS)
>  		return ret;
>  
> -	if (page_has_private(page))
> -		attach_page_private(newpage, detach_page_private(page));

If I'm reading it correctly, the private pointer does not need to be set
like that anymore because it's done somewhere during the
filemap_migrate_folio() call.

> -
> -	if (PageOrdered(page)) {
> -		ClearPageOrdered(page);
> -		SetPageOrdered(newpage);
> +	if (folio_test_ordered(src)) {
> +		folio_clear_ordered(src);
> +		folio_set_ordered(dst);
>  	}


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
