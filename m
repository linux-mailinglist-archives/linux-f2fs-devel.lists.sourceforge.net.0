Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 62FB78889E9
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 25 Mar 2024 04:06:28 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1roafF-00071x-3e;
	Mon, 25 Mar 2024 03:06:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1roafE-00071q-2V
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 25 Mar 2024 03:06:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=s/mTgyc/x/PJOED2DxyGIvurmInOJQW/Y/5HSqBxIfk=; b=kY4NrVwDrhw2Q787w1IqigwanI
 3I5GvHncSFt/W+0fmrSy+aa2dZktsuQZlRUHmC6KOrFT+Umh0ecfFDZZuYBTAoqaZN3/X1GiJ56OI
 9u5May/Gc2Yu9pJW3qDQqOuUoaEaRuY3io4GpGaXa56rfN60OrbrmQPFmra6OswP1mJA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=s/mTgyc/x/PJOED2DxyGIvurmInOJQW/Y/5HSqBxIfk=; b=RoMzi0FaErasCrLh9eL7PIcNop
 bHUihv4X9zPUw9XAqN1jNwBdqHhwuoaTeINkZQs/qoTT2IqkcJtg/hP2ETY5WgvFdqt0yiQg1rJYR
 F9jJzrGR2j7uEIHdtFCEcW/Z/7mHSiapFwuFSikyaxNrqtcATmh8RPqp7a6pRabw84zw=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1roafA-0007H5-QF for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 25 Mar 2024 03:06:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B638C60C8A;
 Mon, 25 Mar 2024 03:06:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC052C433C7;
 Mon, 25 Mar 2024 03:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711335966;
 bh=m0pLVWc50tF42FKUpj7r22FDMHA0roMZnY6ibDzMcZo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=LqAL/54mco4tPpXgGDR4Wrkr9H/RnX6Z5Ghmcek0H1CdYgLTyTXE+o9kKmwRecPXd
 Q2xmm9MRy4ny7PfZ8e1a7qQcRvsHDOZ4mjfY5Xx0xqVRjyeXT4/1lWe/HbcMg5B1tF
 8L11rdjJyfZilO9Xk5Nn3vTjSdcwcgzR4EuKdaRi9ttuRI1Htu/GdH/bftgpzo8lCt
 d3ENb/kk0psbZlTbXXtlSLr81aPTVT8ILghmHQRrHzU0cyQqgat1095Fgye7pZUYgj
 9iY0IFLyhewTbjhKo7XVUgcBLtb9YT7vyh7oUD6toTgDkE5LYoNddW6CNiNrlejhKs
 6vzsh/DAozhyg==
Message-ID: <bd72565c-052e-457a-ac08-7bf40077992c@kernel.org>
Date: Mon, 25 Mar 2024 11:06:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
References: <esesb6dg5omj7e5sdnltnapuuzgmbdfmezcz6owsx2waqayc5q@36yhz4dmrxh6>
 <CAHj4cs874FivTdmw=VMJwTzzLFZWb4OKqvNGRN0R0O+Oiv4aYA@mail.gmail.com>
 <CAHj4cs_eOSafp0=cbwjNPR6X2342GF_cnUTcXf6RjrMnoOHSmQ@mail.gmail.com>
 <msec3wnqtvlsnfsw34uyrircyco3j3y7yb4gj75ofz5gnn57mg@qzcq5eumjwy5>
 <CAHj4cs-DC7QQH1W3KSzXS8ERMPW-6XQ9-w_Mzr1zEGF7ZZ=K3w@mail.gmail.com>
 <d6vi6aq44c4a7ekhck6zxxy4woa5q7v5bnvn5qmad7nqk7egms@ptc72tum4bks>
 <gngdj77k4picagsfdtiaa7gpgnup6fsgwzsltx6milmhegmjff@iax2n4wvrqye>
 <f4f1cfac-8520-47a1-ad18-b9922aa0545d@kernel.org>
 <jpgro32y5r3mpyh24hoqnwkbcg67twbmcxeicoa5qt723u7ehk@4imddarhtt74>
 <cd11bff9-46cc-4148-9dcf-4087e1621985@kernel.org>
 <l7n5vbvpfmeutotnznxubhdr3migk5kpxgm6j5n265dnfgdtzo@iod4gcsfy5om>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <l7n5vbvpfmeutotnznxubhdr3migk5kpxgm6j5n265dnfgdtzo@iod4gcsfy5om>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/3/25 10:14, Shinichiro Kawasaki wrote: > On Mar 24, 
 2024 / 20:13, Chao Yu wrote: > ... >> Hi Shinichiro, >> >> Can you please
 check below diff? IIUC, for the case: f2fs_map_blocks() >> returns [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1roafA-0007H5-QF
Subject: Re: [f2fs-dev] [bug report]WARNING: CPU: 22 PID: 44011 at
 fs/iomap/iter.c:51 iomap_iter+0x32b observed with blktests zbd/010
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
Cc: linux-block <linux-block@vger.kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Yi Zhang <yi.zhang@redhat.com>, Bart Van Assche <bvanassche@acm.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/3/25 10:14, Shinichiro Kawasaki wrote:
> On Mar 24, 2024 / 20:13, Chao Yu wrote:
> ...
>> Hi Shinichiro,
>>
>> Can you please check below diff? IIUC, for the case: f2fs_map_blocks()
>> returns zero blkaddr in non-primary device, which is a verified valid
>> block address, we'd better to check m_flags & F2FS_MAP_MAPPED instead
>> of map.m_pblk != NULL_ADDR to decide whether tagging IOMAP_MAPPED flag
>> or not.
>>
>> ---
>>   fs/f2fs/data.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
>> index 6f66e3e4221a..41a56d4298c8 100644
>> --- a/fs/f2fs/data.c
>> +++ b/fs/f2fs/data.c
>> @@ -4203,7 +4203,7 @@ static int f2fs_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
>>   	if (WARN_ON_ONCE(map.m_pblk == COMPRESS_ADDR))
>>   		return -EINVAL;
>>
>> -	if (map.m_pblk != NULL_ADDR) {
>> +	if (map.m_flags & F2FS_MAP_MAPPED) {
>>   		iomap->length = blks_to_bytes(inode, map.m_len);
>>   		iomap->type = IOMAP_MAPPED;
>>   		iomap->flags |= IOMAP_F_MERGED;
>>
> 
> Thanks Chao, I confirmed that the diff above avoids the WARN and zbd/010
> failure. From that point of view, it looks good.

Thank you for the confirmation. :)

> 
> One thing I noticed is that the commit message of 8d3c1fa3fa5ea ("f2fs:
> don't rely on F2FS_MAP_* in f2fs_iomap_begin") says that f2fs_map_blocks()
> might be setting F2FS_MAP_* flag on a hole, and that's why the commit
> avoided the F2FS_MAP_MAPPED flag check. So I was not sure if it is the
> right thing to reintroduce the flag check.

I didn't see such logic in previous f2fs_map_blocks(, F2FS_GET_BLOCK_DIO) codebase,
I doubt it hits the same case: map.m_pblk is valid zero blkaddr which locates in
the head of secondary device? What do you think?

Quoted commit message from 8d3c1fa3fa5ea:

When testing with a mixed zoned / convention device combination, there
are regular but not 100% reproducible failures in xfstests generic/113
where the __is_valid_data_blkaddr assert hits due to finding a hole.

Previous code:

-	if (map.m_flags & (F2FS_MAP_MAPPED | F2FS_MAP_UNWRITTEN)) {
-		iomap->length = blks_to_bytes(inode, map.m_len);
-		if (map.m_flags & F2FS_MAP_MAPPED) {
-			iomap->type = IOMAP_MAPPED;
-			iomap->flags |= IOMAP_F_MERGED;
-		} else {
-			iomap->type = IOMAP_UNWRITTEN;
-		}
-		if (WARN_ON_ONCE(!__is_valid_data_blkaddr(map.m_pblk)))
-			return -EINVAL;

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
