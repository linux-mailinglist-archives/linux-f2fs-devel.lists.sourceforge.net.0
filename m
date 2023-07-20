Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4B575AE23
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 20 Jul 2023 14:17:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qMSad-0002Ew-JK;
	Thu, 20 Jul 2023 12:17:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hare@suse.de>) id 1qMSaU-0002Ed-3r
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 20 Jul 2023 12:16:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qJeevWCTbOxeUOBTAxfygV2zVKl4pRNiVV/Sn4Vc5g8=; b=OApjBWJqiX+3TZfUaNuB0jk+K2
 xVwxKdih0F39fCZRmCSkcXPil88u9+rANLVbsh+g0Znrc5uHryGxop+PUJVXyMt+yI9TCHSKEGSAj
 zz/DfK7/AnTV+m8PUggNgXOmFLrIwUzEABiqzbFgK8wZyzY9rY9B1Bl/+whV1MED9Ovs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qJeevWCTbOxeUOBTAxfygV2zVKl4pRNiVV/Sn4Vc5g8=; b=Ee0CBHpd5Ajp49rSqJc0HMmjWt
 2Oh2r3YCv6M+CFnU1Bru7pv9MmIKXTRUe7FIMn6iOSM14xFr1LjEA3Kcyn30TDZvFBKq+GH1UGBOe
 97Vy0svHQq4nMx8L6oWj+Nq6nI+vNSGmacjMtrcVIyItmCRrRsKvKTBmwPCzpVIQ4SZc=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qMSaR-00E2Q0-EI for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 20 Jul 2023 12:16:54 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 311FA22BEC;
 Thu, 20 Jul 2023 12:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1689855405; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qJeevWCTbOxeUOBTAxfygV2zVKl4pRNiVV/Sn4Vc5g8=;
 b=Y7xfme4rPrCF5hEC5pbUvdrHOtse6c2XE5dQH4ofisst0BxXhq5fzSvvvudIq0qb1fgAZ3
 nvIjKrBX9SBniQArDMHq3Eo1F5gHSAGQmoz/tE4t4qxq6hUdsPyEUo9DVqT6M2kkkhHlFw
 wusKJBAY7+a0/4rdZ8XEmsB7vqMiu20=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1689855405;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qJeevWCTbOxeUOBTAxfygV2zVKl4pRNiVV/Sn4Vc5g8=;
 b=FfN5Vi6mxKPEw3x2oCzsXOategHapN8ngq0O/mlx3Dt3iIlpkGc1UcEnhLUPz5UTPIunq7
 Q/g7Z3f9m59q7UAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 17569138EC;
 Thu, 20 Jul 2023 12:16:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id V/cVBa0luWQKJgAAMHmgww
 (envelope-from <hare@suse.de>); Thu, 20 Jul 2023 12:16:45 +0000
Message-ID: <2fda17af-ed88-2332-27a1-61496f943e91@suse.de>
Date: Thu, 20 Jul 2023 14:16:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>
References: <20230424054926.26927-1-hch@lst.de>
 <20230424054926.26927-17-hch@lst.de>
 <b96b397e-2f5e-7910-3bb3-7405d0e293a7@suse.de>
 <20230720120650.GA13266@lst.de>
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20230720120650.GA13266@lst.de>
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 7/20/23 14:06, Christoph Hellwig wrote: > On Fri, May 19, 
 2023 at 04:22:01PM +0200, Hannes Reinecke wrote: >> I'm hitting this during
 booting: >> [ 5.016324] <TASK> >> [ 5.030256] iomap_iter+0x11a/ [...] 
 Content analysis details:   (-2.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.28 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1qMSaR-00E2Q0-EI
Subject: Re: [f2fs-dev] [PATCH 16/17] block: use iomap for writes to block
 devices
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 linux-nfs@vger.kernel.org, cluster-devel@redhat.com, linux-xfs@vger.kernel.org,
 Miklos Szeredi <miklos@szeredi.hu>, "Darrick J. Wong" <djwong@kernel.org>,
 linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, David Howells <dhowells@redhat.com>,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-ext4@vger.kernel.org,
 ceph-devel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 7/20/23 14:06, Christoph Hellwig wrote:
> On Fri, May 19, 2023 at 04:22:01PM +0200, Hannes Reinecke wrote:
>> I'm hitting this during booting:
>> [    5.016324]  <TASK>
>> [    5.030256]  iomap_iter+0x11a/0x350
>> [    5.030264]  iomap_readahead+0x1eb/0x2c0
>> [    5.030272]  read_pages+0x5d/0x220
>> [    5.030279]  page_cache_ra_unbounded+0x131/0x180
>> [    5.030284]  filemap_get_pages+0xff/0x5a0
>> [    5.030292]  filemap_read+0xca/0x320
>> [    5.030296]  ? aa_file_perm+0x126/0x500
>> [    5.040216]  ? touch_atime+0xc8/0x150
>> [    5.040224]  blkdev_read_iter+0xb0/0x150
>> [    5.040228]  vfs_read+0x226/0x2d0
>> [    5.040234]  ksys_read+0xa5/0xe0
>> [    5.040238]  do_syscall_64+0x5b/0x80
>>
>> Maybe we should consider this patch:
> 
> As willy said this should be taken care of by the i_size check.
> Did you run with just this patch set or some of the large block
> size experiments on top which might change the variables?
> 
> I'll repost the series today without any chances in the area, and
> if you can reproduce it with just that series we need to root
> cause it, so please send your kernel and VM config along for the
> next report.

I _think_ it's been resolve now; I've rewritten my patchset (and the 
patches where it's based upon) several times now, so it might be a stale 
issue now.

Eagerly awaiting your patchset.

Cheers,

Hannes



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
