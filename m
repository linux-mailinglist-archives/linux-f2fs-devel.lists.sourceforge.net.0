Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 586DE70B256
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 22 May 2023 02:07:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q0t5a-0007as-Kt;
	Mon, 22 May 2023 00:07:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dlemoal@kernel.org>) id 1q0t5T-0007al-3B
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 22 May 2023 00:07:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VKZkdHlo0vaovrHKUVt7LDP5fGNVxr3UGKfBoA9uSSo=; b=iZiL4Akf9S4SAZRkJhqjmuAwS9
 ls+lo40b9nCZDbR0nS4f4JcUiNvlCFfUbeofwPe4xkVgqvyF0d4ujkPS1vqDjxvfqEWfp6QsViy+d
 zi3YdWOUFXLfyEDVNc77SwRw8MhB9Y0TU0az4HoPLKn88cpJEcRlAsY6KgDvScXAi6+I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VKZkdHlo0vaovrHKUVt7LDP5fGNVxr3UGKfBoA9uSSo=; b=SPQXZBEbO9giZdryR1NZp0ng8G
 EzxyI4oeIIlaKvphmr+/6s/kpEAsdfU+8jDY8V4YX0l9uOFDgfT/l3tMTmo75lr4ZiclfXetHkLcQ
 jdGUcoxv7KToFFFaOpJY2f7gJIPcsgkUkFaJAorEvN1D9I4hXqEcrh3tNi8MskEvNrm0=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q0t5S-0004wR-Ql for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 22 May 2023 00:07:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5EC15611F3;
 Mon, 22 May 2023 00:07:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21004C433D2;
 Mon, 22 May 2023 00:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684714056;
 bh=logUhuMuaDvrFGp87a3eXuBZVgOPH38ZQeOk9oWMxhA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=jinVW+8eNfBmMJvPLIRbSMrX3C+ysBP344vv+qMi84FjV2X+zzFwAh8xh+THsy/A8
 f7n7CscOp9ldNzbMYKqQROCTt+AS2stpbpTN5qKl4tiJAwkxedNRln1tS95W+JHVfL
 MlrT+lXxAxiWe2UTwO7ndf3emdaYv3zxBJ5GihMIvhIezJ3AGMv4m3w3sorDMEvyPf
 FkNSWSW6DtqVfjWPCwUzSDgy0Ug7/6HBtXxZfFSyEx8EAJMuiEkELi3AT9cEPjV+k5
 p0DQ1x6g3QKPp4NSjgQJvj1BT18DFRjljg71PKaVdhIQjyEcKo9DHNhzPm+akQ6HSZ
 HYHWZZRzzH9tA==
Message-ID: <73104483-a4ae-b7e9-2383-c28714e9859b@kernel.org>
Date: Mon, 22 May 2023 09:07:33 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Matthew Wilcox <willy@infradead.org>
References: <20230519093521.133226-1-hch@lst.de>
 <20230519093521.133226-10-hch@lst.de>
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20230519093521.133226-10-hch@lst.de>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 5/19/23 18:35, Christoph Hellwig wrote: > Use the common
 helpers for direct I/O page invalidation instead of > open coding the logic.
 This leads to a slight reordering of checks > in __iomap_dio_rw [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q0t5S-0004wR-Ql
Subject: Re: [f2fs-dev] [PATCH 09/13] iomap: use kiocb_write_and_wait and
 kiocb_invalidate_pages
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
Cc: "Darrick J. Wong" <djwong@kernel.org>, linux-mm@kvack.org,
 Andreas Gruenbacher <agruenba@redhat.com>, Miklos Szeredi <miklos@szeredi.hu>,
 cluster-devel@redhat.com, Ilya Dryomov <idryomov@gmail.com>,
 linux-ext4@vger.kernel.org, linux-nfs@vger.kernel.org,
 linux-block@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
 Xiubo Li <xiubli@redhat.com>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>,
 "open list:F2FS FILE SYSTEM" <linux-f2fs-devel@lists.sourceforge.net>,
 linux-xfs@vger.kernel.org, Anna Schumaker <anna@kernel.org>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 5/19/23 18:35, Christoph Hellwig wrote:
> Use the common helpers for direct I/O page invalidation instead of
> open coding the logic.  This leads to a slight reordering of checks
> in __iomap_dio_rw to keep the logic straight.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Looks OK to me.

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

-- 
Damien Le Moal
Western Digital Research



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
