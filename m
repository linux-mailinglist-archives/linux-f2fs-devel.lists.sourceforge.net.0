Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F1E9DBE82
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 29 Nov 2024 03:01:37 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tGqK0-0002J8-Gd;
	Fri, 29 Nov 2024 02:01:28 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tGqJz-0002Iw-MZ
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 29 Nov 2024 02:01:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0UUkzlud27COmkiICBFPF8wWjl784H79yJVReVXuf6o=; b=ky7hJpk3fsUpVO3+fJ/j9GTw1c
 GrvIsdRxm4h+7A35Z+ion+/a0d0KVPX5h9s2DvzJzoZ5Rfj1VY3T+yQZDBlSJmIMozFa3eWWlnm18
 N3ORCkyx7eyuDOEQUGd4xAidDjtSVfGrgMzwcj9OChZHCtzw6RQLWM6l5SQ2Z/q+OpRU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0UUkzlud27COmkiICBFPF8wWjl784H79yJVReVXuf6o=; b=Rck0p32iMzwH6qcXmPC0MEDNrN
 KOeha3Ya+RQH/XBHC0KPJu7vmy2uKpQ22rR1PeYtmeKdZw49YSOZyiCyr+qyATsO9WQpbDm73r2MH
 1gFNrW26P6ZsxSeDZCAoVJsH5PxtPnqd6JI5etlwi9xQzKUSZbskhcvefevzwPnWMoI8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tGqJz-0005f8-0S for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 29 Nov 2024 02:01:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2391A5C0385;
 Fri, 29 Nov 2024 02:00:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2275C4CECE;
 Fri, 29 Nov 2024 02:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732845681;
 bh=xXZFwynv6anzz67LCtvbnWIsKlnNImIWMTMGnxNcqk4=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=EeJDpuy5lFk7zngbyXmuE0X0gkbRfeoQsPLX9AJk9wdksa9gFhpstCKY3xFC/v3ve
 QC7TXK2r54R4TksjNm5HuTQZ2bGW2ZwRiqPB6pM/JxoXVrhSiSPsjzF4bw24XzN+VY
 iV17bH0fThNghNU0qT5XmQa+kJc0sJBRWnQPn3uObZUEoPvqHC4DGRVxAXRJvYwLxS
 lq8dV+kx9qQTYYAS4OCxfhke/OmNlklznD8GHjhdIFDVduztC4DgRMC4TQgBnou3jN
 DDvnfQYOa7IiPbp0rHNntjd1/+eHfwRKzZ5/icJLeXQGISp34mU8THj5pbeUnwQEBS
 OWNwQ+frZayPQ==
Message-ID: <63a65be2-7ad9-4d65-8c3e-d872f83c011d@kernel.org>
Date: Fri, 29 Nov 2024 10:01:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Leo Stone <leocstone@gmail.com>, jaegeuk@kernel.org
References: <20241124010459.23283-1-leocstone@gmail.com>
 <1652260c-7657-4f40-ac79-027666f512f0@kernel.org>
 <icjuhtz35zvp5j6zvgbubydbmirbsr4ceasgxr3rk333bj55dp@mp5yf532hd4i>
Content-Language: en-US
In-Reply-To: <icjuhtz35zvp5j6zvgbubydbmirbsr4ceasgxr3rk333bj55dp@mp5yf532hd4i>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/11/26 1:56, Leo Stone wrote: > On Mon, Nov 25, 2024
 at 07:16:41PM +0800, Chao Yu wrote: >> >> I'm fine w/ this change, but I
 didn't get it, how did above commit introduce >> this bug? > > Hell [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tGqJz-0005f8-0S
Subject: Re: [f2fs-dev] [PATCH] f2fs: Add check for deleted inode
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/11/26 1:56, Leo Stone wrote:
> On Mon, Nov 25, 2024 at 07:16:41PM +0800, Chao Yu wrote:
>>
>> I'm fine w/ this change, but I didn't get it, how did above commit introduce
>> this bug?
> 
> Hello Chao,
> 
> The commit from the bisect didn't exactly introduce this bug, since it
> would still be possible to make a different image that does the exact
> same thing in the older code.
> 
> This commit was blamed in the bisect because it changes the layout of
> struct f2fs_inode:
> 
>> @@ -271,6 +272,10 @@ struct f2fs_inode {
>> 			__le32 i_inode_checksum;/* inode meta checksum */
>> 			__le64 i_crtime;	/* creation time */
>> 			__le32 i_crtime_nsec;	/* creation time in nano scale */
>> +			__le64 i_compr_blocks;	/* # of compressed blocks */
>> +			__u8 i_compress_algorithm;	/* compress algorithm */
>> +			__u8 i_log_cluster_size;	/* log of cluster size */
>> +			__le16 i_padding;		/* padding */
>> 			__le32 i_extra_end[0];	/* for attribute size calculation */
>> 		} __packed;
>> 		__le32 i_addr[DEF_ADDRS_PER_INODE];	/* Pointers to data blocks */
> 
> This changes F2FS_TOTAL_EXTRA_ATTR_SIZE, which allows the syzbot
> reproducer's inode to pass the sanity check for corrupted i_extra_size.
> Before this change, the inode gets rejected as corrupt:
> 
>> [   62.794566][ T9662] F2FS-fs (loop0): sanity_check_inode: inode (ino=7) has corrupted i_extra_isize: 36, max: 24

Leo,

Ah, right, thanks for the explanation, anyway, can you please correct this
"Fixes line"?

Thanks,

> 
> Thanks,
> Leo



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
