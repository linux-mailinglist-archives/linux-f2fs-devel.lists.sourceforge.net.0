Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B0BC13A2D3F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 10 Jun 2021 15:40:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lrKv4-00084v-AZ; Thu, 10 Jun 2021 13:40:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <miklos@szeredi.hu>) id 1lrKv3-00084o-1J
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 10 Jun 2021 13:40:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ERGvPKyejnfegUXiUI5TBALLR98HuWU+7/Q+tACPbYI=; b=BbxNS6YrWaoR5lgk13C0ZoYLNw
 F7dlmbfX5+KPN9SNT6tX5g5Yf/MbQiJ500KwPKOoOygD5i61zHb2d0IrJGetAvgY5rNvn0M88cM6D
 SzZps+b8jjHdC2pIrYByOrsFAtVoJ+vMXZCECzZOnTNHAbdkLlLUEdwgmV8flkLN6dQM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ERGvPKyejnfegUXiUI5TBALLR98HuWU+7/Q+tACPbYI=; b=YuTCynKd0Jo0MMeZWBQldLy0uR
 iTA2Qiiu5IgaNcuUDOLZ2XS/pHYpDQZOfdYkJM6w5T21oRf5biWrC2QRmcBztmWvh14aNcI61vJta
 768pOjUc7nMNtD1vTioZZHteA6peenfjazfepIWQJK8vAj99S2R06iQjnEissDg2RDUw=;
Received: from mail-yb1-f175.google.com ([209.85.219.175])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1lrKv0-00054B-0M
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 10 Jun 2021 13:40:27 +0000
Received: by mail-yb1-f175.google.com with SMTP id q21so40790550ybg.8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 10 Jun 2021 06:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=szeredi.hu; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ERGvPKyejnfegUXiUI5TBALLR98HuWU+7/Q+tACPbYI=;
 b=bWmonaOQtQnoMrqggNjQmbBLp/OFsefkhaXRpT3N30oDxasxyxX5+zHqOhyxg8TwQ1
 9WhDWldZuNugQzNq9CRVa79/7odXcgVZfZJpa4jozV3UwwVJh+rViZAq1j+cqvO83+lk
 Ul0lp34cK0STCoHisDcJwkiJqPEl1W1Jca9Ac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ERGvPKyejnfegUXiUI5TBALLR98HuWU+7/Q+tACPbYI=;
 b=RxnTgS9oyuGqX18YQBJjrOvw4FjYNkC3KPWSFp6wSgQIdo1RAJiJry0oWG7xsVm7kH
 0VZfyErswPd5xDl8BblZ4Z1Sfezqo7cJ0MiUCelz3AL26+ZDRJ0t5BuQQXQlrqaTLIKl
 IYTgxp8zeQFWQ89Tb6MMuOqXB0dvcYGmMXxMh9pvJYQNdvg9qb2TA26iU3bG0S0yCddG
 8P8aKwcAlyXuVq+EMKQa2kanIf6bCd/aPh3XXZmILB22KkI7HZQ+7XzpQ1Aw4VieoQGJ
 bTCY75554IzWtbEdoL1G+USCvgB47elp1oBrCN9HP0/ANMB7tDqFE3KLwC1PpyG58IJ8
 inXg==
X-Gm-Message-State: AOAM530+Z9rDcELYvCdLsDVg7+g4cdTaYIwe81uxIEkxBHz2X64yKwRg
 RUq75e/Fn7db8cn1dDkQf9t1zeuFk0c3FWn5wxoOPy/V9z/JZQ==
X-Google-Smtp-Source: ABdhPJzSnBnKZyOmEQg1Mlk1J3k9vxKYbX0hKrYXjQBdDrHZwFo89gBvp5Cl9ryn+jRW8T0jKkHsp9O4DmV9/7gYf0I=
X-Received: by 2002:ab0:2690:: with SMTP id t16mr4105093uao.9.1623328942641;
 Thu, 10 Jun 2021 05:42:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210607144631.8717-1-jack@suse.cz>
 <20210607145236.31852-12-jack@suse.cz>
In-Reply-To: <20210607145236.31852-12-jack@suse.cz>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Thu, 10 Jun 2021 14:42:12 +0200
Message-ID: <CAJfpegtLD6SzSOh0phgNcdU_Xp+pzUCQWZ+CB8HjKFV5nS3SCA@mail.gmail.com>
To: Jan Kara <jack@suse.cz>
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.219.175 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: szeredi.hu]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.175 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.1 DKIM_INVALID           DKIM or DK signature exists, but is not valid
X-Headers-End: 1lrKv0-00054B-0M
Subject: Re: [f2fs-dev] [PATCH 12/14] fuse: Convert to using invalidate_lock
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
Cc: CIFS <linux-cifs@vger.kernel.org>, Damien Le Moal <damien.lemoal@wdc.com>,
 Ext4 <linux-ext4@vger.kernel.org>, Ted Tso <tytso@mit.edu>,
 "Darrick J. Wong" <darrick.wong@oracle.com>, Jeff Layton <jlayton@kernel.org>,
 Steve French <sfrench@samba.org>, Dave Chinner <david@fromorbit.com>,
 Matthew Wilcox <willy@infradead.org>, linux-f2fs-devel@lists.sourceforge.net,
 Christoph Hellwig <hch@infradead.org>, linux-mm <linux-mm@kvack.org>,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Johannes Thumshirn <jth@kernel.org>,
 linux-xfs <linux-xfs@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, 7 Jun 2021 at 16:52, Jan Kara <jack@suse.cz> wrote:
>
> Use invalidate_lock instead of fuse's private i_mmap_sem. The intended
> purpose is exactly the same. By this conversion we fix a long standing
> race between hole punching and read(2) / readahead(2) paths that can
> lead to stale page cache contents.
>
> CC: Miklos Szeredi <miklos@szeredi.hu>
> Signed-off-by: Jan Kara <jack@suse.cz>

Reviewed-by: Miklos Szeredi <mszeredi@redhat.com>

Thanks,
Miklos


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
