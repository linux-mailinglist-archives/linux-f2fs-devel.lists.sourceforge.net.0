Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 041917487C1
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  5 Jul 2023 17:19:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qH4I6-0002UR-OY;
	Wed, 05 Jul 2023 15:19:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bart.vanassche@gmail.com>) id 1qH4I1-0002UH-Ns;
 Wed, 05 Jul 2023 15:19:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vhOVd+fM39By6Neo4SNlvIwXWgDBhgramNmEhS79nFc=; b=PA+AFaky+3PRzV5GTum8zsWwZG
 pbzR+fv24zy1GVlxAraMZJdFJ7QqAP2vXicKUhKSO6SuitSv/AdIxxtXCQJlIb9hVe4YIqvoz+ROD
 DiayValDG7OCr4N54Qt9sQc8rqC1n1bmYvP1k6HyEWBrfIAW8RevMya5R+2gBIEpYRDk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vhOVd+fM39By6Neo4SNlvIwXWgDBhgramNmEhS79nFc=; b=GBIgdYjKWT+mMVEZYW6kmmWInl
 dbFh60RM52onMkSxWOeqxPF/dwrofCPZFXPJqPp2ccTGr0WOI4PMw5VitpCbV1rlNXH9yluPn4rhy
 0ACw+M2gzlyzM290Tl+hdTSnEfSvE5dfIY4H2UDKOb6619y6vVxyj+rRjlmHlAQViIHA=;
Received: from mail-io1-f48.google.com ([209.85.166.48])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qH4Hx-0002AB-PG; Wed, 05 Jul 2023 15:19:33 +0000
Received: by mail-io1-f48.google.com with SMTP id
 ca18e2360f4ac-78362f574c9so240991439f.3; 
 Wed, 05 Jul 2023 08:19:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688570364; x=1691162364;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vhOVd+fM39By6Neo4SNlvIwXWgDBhgramNmEhS79nFc=;
 b=C7G0hujHyhZzvdK0EDMu7lnXf3QZWs+FzIWjK6aHd4Cv17swLo8prKDMpgxH0zQPK7
 Z/5Wnel3/0OXFdo8ELbB09Caq3lXcvWd2xwxXT4E8q/MyQQpZmm0Ot9nqJVHiVSMBJWX
 zFZO3N7KITys8McBgmjPDrAB7kCHMbW7EL+m432xu7K10OHKHWloD2EmLnKO4IbueGqt
 FhdUqGoIwr9FzMH8K96CvTJ+8P0DXZSEgMJzKSfoQY/4nXeZtn7wcyiU587mmFxHHBLH
 mYnI11GS7gbLKdocVPoQyhhODwLf+hAo0x2OiyL/TXJZJi93y5YrrW5Xl0mBG/N/4h1o
 NAcQ==
X-Gm-Message-State: AC+VfDw14/XaruNTAnhaHdlGzAUNzu/MuwWgPOzlllPXbNlkbHtTvUFj
 TrNDfQDcdtEtu0RWVzo/Yd4=
X-Google-Smtp-Source: ACHHUZ70uoI88DRVhGiNe4v8NMOn4CckRug5A25bO6UrnrhXn4O+oQb9CB+u9z1UucgpvIObIHjohw==
X-Received: by 2002:a05:6602:2113:b0:784:314f:8d68 with SMTP id
 x19-20020a056602211300b00784314f8d68mr18093430iox.1.1688570364015; 
 Wed, 05 Jul 2023 08:19:24 -0700 (PDT)
Received: from ?IPV6:2620:15c:211:201:c1f1:7d21:6172:cbd2?
 ([2620:15c:211:201:c1f1:7d21:6172:cbd2])
 by smtp.gmail.com with ESMTPSA id
 l6-20020a656806000000b005579c73d209sm15456631pgt.1.2023.07.05.08.19.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jul 2023 08:19:23 -0700 (PDT)
Message-ID: <1ea08f84-f900-92f2-e32b-2db242a74559@acm.org>
Date: Wed, 5 Jul 2023 08:19:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Matthew Wilcox <willy@infradead.org>
References: <20230629165206.383-1-jack@suse.cz>
 <20230704122224.16257-1-jack@suse.cz>
 <bb91e76b-0bd8-a949-f8b9-868f919ebcb9@acm.org>
 <ZKRFSZQglwCba9/i@casper.infradead.org>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <ZKRFSZQglwCba9/i@casper.infradead.org>
X-Spam-Score: 0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 7/4/23 09:14, Matthew Wilcox wrote: > On Tue, Jul 04, 2023
 at 07:06:26AM -0700, Bart Van Assche wrote: >> On 7/4/23 05:21, Jan Kara
 wrote: >>> +struct bdev_handle { >>> + struct block_device *bdev; [...] 
 Content analysis details:   (0.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.48 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.48 listed in wl.mailspike.net]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [bart.vanassche[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and
 EnvelopeFrom freemail headers are different
 -0.1 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1qH4Hx-0002AB-PG
Subject: Re: [f2fs-dev] [PATCH 01/32] block: Provide blkdev_get_handle_*
 functions
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
Cc: Dave Kleikamp <shaggy@kernel.org>, jfs-discussion@lists.sourceforge.net,
 Jan Kara <jack@suse.cz>, "Darrick J. Wong" <djwong@kernel.org>,
 linux-nvme@lists.infradead.org, Joseph Qi <joseph.qi@linux.alibaba.com>,
 dm-devel@redhat.com, target-devel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Jack Wang <jinpu.wang@ionos.com>,
 Alasdair Kergon <agk@redhat.com>, drbd-dev@lists.linbit.com,
 linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org,
 linux-scsi@vger.kernel.org, Sergey Senozhatsky <senozhatsky@chromium.org>,
 Christoph Hellwig <hch@infradead.org>, xen-devel@lists.xenproject.org,
 Gao Xiang <xiang@kernel.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Kent Overstreet <kent.overstreet@gmail.com>,
 Sven Schnelle <svens@linux.ibm.com>, linux-pm@vger.kernel.org,
 Mike Snitzer <snitzer@kernel.org>, Joern Engel <joern@lazybastard.org>,
 reiserfs-devel@vger.kernel.org, linux-block@vger.kernel.org,
 linux-bcache@vger.kernel.org, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Jens Axboe <axboe@kernel.dk>, linux-raid@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-ext4@vger.kernel.org, Ted Tso <tytso@mit.edu>,
 linux-mm@kvack.org, Song Liu <song@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 Minchan Kim <minchan@kernel.org>, ocfs2-devel@oss.oracle.com,
 Anna Schumaker <anna@kernel.org>, linux-fsdevel@vger.kernel.org,
 "Md. Haris Iqbal" <haris.iqbal@ionos.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-erofs@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 7/4/23 09:14, Matthew Wilcox wrote:
> On Tue, Jul 04, 2023 at 07:06:26AM -0700, Bart Van Assche wrote:
>> On 7/4/23 05:21, Jan Kara wrote:
>>> +struct bdev_handle {
>>> +	struct block_device *bdev;
>>> +	void *holder;
>>> +};
>>
>> Please explain in the patch description why a holder pointer is introduced
>> in struct bdev_handle and how it relates to the bd_holder pointer in struct
>> block_device. Is one of the purposes of this patch series perhaps to add
>> support for multiple holders per block device?
> 
> That is all in patch 0/32.  Why repeat it?

This cover letter: https://lore.kernel.org/linux-block/20230629165206.383-1-jack@suse.cz/T/#t?

The word "holder" doesn't even occur in that cover letter so how could the
answer to my question be present in the cover letter?

Bart.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
