Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0F01E8074
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 29 May 2020 16:40:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jegB8-0002QK-Pa; Fri, 29 May 2020 14:40:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <axboe@kernel.dk>) id 1jegB6-0002QC-Gy
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 29 May 2020 14:40:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sstDEw2eR7/x5s00uzGBoVK1nqE9b65b7cAMAqhOjao=; b=ekL5Lv36nNSdU1QZs0QtoV3pui
 MagsXMd5unwZAo6UzNRZkxREhC9C0by8Yrq2BvwSt9ndFYVLU+wTSX+wlg60ZRvT4+sPfmvPovVCQ
 am6v8uP8//Dep8a9v/IKnf19ZeGSeg50e/8RidyKKIH2Es64dP8xxC1AUE78s+54cXwM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sstDEw2eR7/x5s00uzGBoVK1nqE9b65b7cAMAqhOjao=; b=KGhS/EQ9+lfuHZffcCYbcOAvnf
 5CLCsL5ne2wzmUwbyWBz91HssEnnxVoQQ6JK+IeJNo67Z5LQKib/kK5GwxAAwHWSi2q4SbkkRYYHn
 jAUWWIOjuKHzz1cTGuj7dJbV1vCMDTNnwxXTjiThx3C3QYMFmNCX7Kj30XddUB9qs/nM=;
Received: from mail-oi1-f196.google.com ([209.85.167.196])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jegB4-00HN2N-Jx
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 29 May 2020 14:40:08 +0000
Received: by mail-oi1-f196.google.com with SMTP id j145so2745857oib.5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 29 May 2020 07:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sstDEw2eR7/x5s00uzGBoVK1nqE9b65b7cAMAqhOjao=;
 b=eE5upXYzk0pow1GTjkztlADM6NfVbrh/uHt+G1jl9EulITHptpOGivfgZ9UM2DZPeT
 QzDSBImSr62zvHA4fpZjPKoOgIad9kZyPX2Pg/8nuAQTJ3/2yu1dOc5WcOu99Kko/uk+
 JHHjcQeYVXofPi/9w67mwpp7taL/v8rnEtFjiUQt2+5HJT1HNIqLVfzk8C15zK0dRQDM
 HprQkgIl0QIfcdgkulZv6c2+BpjhhJc39zy3lRejrUhTw58N+xFCRBzYs65EUgEZZaQb
 C23jReqIIypb479CHVfyFfIhwVVplo1+96n+FWZRlsJS/ZWLbHO247w+VeMKyAtOGXp+
 Nwmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sstDEw2eR7/x5s00uzGBoVK1nqE9b65b7cAMAqhOjao=;
 b=dqNyJAow3L9AwOynIDk1+OW3+BDKoirfWo+a9NbgWo8GFLswxFsacEQdojuL14wemb
 tIrFhb1s43sMGBLH5F+gJnzZi+hWdhNzRkICypzFyXbOC/iTVgLW8+dc2IVJiLwaWkdn
 HSMfAYWm8AOmc8NVGYZiZLOOJBFEhMYFbx/jcj5mopU655JTCPCEuquJ0mYaxfu6KwJK
 JPSeO76sOylOqNJRYkH9fmuuQri+3igAZ5CPy/YV6Y0+sOxJl4ZZhwvYccQNZ/GAQEY6
 5XbQuxWYLC4FsouBsY58fHX6eINdrTc2cJcL+6Qhc0Qbebp2UFHhi4uPaK9njnH6llj0
 3wnQ==
X-Gm-Message-State: AOAM531YQVcYsP+d9Am8g2aaE5kEk6EHpIoLucBlqGgXNf9y4ou1wDbi
 oZ+suUCOUFcjZudx0aId1mbr5wA1Ebu0DNae
X-Google-Smtp-Source: ABdhPJx/vZKTQwjkEYDfjCmjXR8SsS9x7O54I1G0OhUxjA27obWAm6HjQIWQQc+C6Ua+WQEtGiJQ1Q==
X-Received: by 2002:a17:90a:bf18:: with SMTP id
 c24mr9827989pjs.171.1590761617982; 
 Fri, 29 May 2020 07:13:37 -0700 (PDT)
Received: from [192.168.1.159] ([65.144.74.34])
 by smtp.gmail.com with ESMTPSA id d2sm6688603pgp.56.2020.05.29.07.13.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 May 2020 07:13:37 -0700 (PDT)
To: Kaitao Cheng <pilgrimtao@gmail.com>, hch@lst.de, sth@linux.ibm.com,
 viro@zeniv.linux.org.uk, clm@fb.com, jaegeuk@kernel.org, hch@infradead.org,
 mark@fasheh.com, dhowells@redhat.com, balbi@kernel.org
References: <20200529141100.37519-1-pilgrimtao@gmail.com>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <c8412d98-0328-0976-e5f9-5beddc148a35@kernel.dk>
Date: Fri, 29 May 2020 08:13:34 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200529141100.37519-1-pilgrimtao@gmail.com>
Content-Language: en-US
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.196 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.196 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jegB4-00HN2N-Jx
Subject: Re: [f2fs-dev] [PATCH v2] blkdev: Replace blksize_bits() with
 ilog2()
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
Cc: hoeppner@linux.ibm.com, heiko.carstens@de.ibm.com,
 linux-nvme@lists.infradead.org, joseph.qi@linux.alibaba.com,
 deepa.kernel@gmail.com, houtao1@huawei.com, linux-s390@vger.kernel.org,
 bvanassche@acm.org, darrick.wong@oracle.com, chaitanya.kulkarni@wdc.com,
 satyat@google.com, borntraeger@de.ibm.com, gor@linux.ibm.com,
 josef@toxicpanda.com, ming.lei@redhat.com, jlbec@evilplan.org,
 songmuchun@bytedance.com, dsterba@suse.com, sagi@grimberg.me,
 damien.lemoal@wdc.com, martin.petersen@oracle.com, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 ocfs2-devel@oss.oracle.com, linux-fsdevel@vger.kernel.org,
 asml.silence@gmail.com, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 5/29/20 8:11 AM, Kaitao Cheng wrote:
> There is a function named ilog2() exist which can replace blksize.
> The generated code will be shorter and more efficient on some
> architecture, such as arm64. And ilog2() can be optimized according
> to different architecture.

When you posted this last time, I said:

"I like the simplification, but do you have any results to back up
 that claim? Is the generated code shorter? Runs faster?"

which you handily ignored, yet sending out a new version. I'm not
going to apply this without justification, your commit message is
handwavy at best.

-- 
Jens Axboe



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
