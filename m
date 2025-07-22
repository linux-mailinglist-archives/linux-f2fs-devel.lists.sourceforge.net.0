Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 20834B0D0E3
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 22 Jul 2025 06:25:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eUV2Wc7alLXzMk4w0h8lJXaSx67w7R+pkskpBCXrvY8=; b=YtAhi5sPlSBsc1G6ltV8ob06hy
	Nr4DI1hZ5rO4RSLwvfdVhqcec2JQOH9cOGba5zXdl3V4fNte68NrHW+7LYwygbv9M0OqJ1MjP2xNf
	JYc5yF41VcNuv3imZk3bkVfktrzs+VOO4aQhPb0NaQgd+WRC1x33yKbrv2xgfdbeqseQ=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ue4ZL-0007dX-Vk;
	Tue, 22 Jul 2025 04:25:35 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yohan.joung@sk.com>) id 1ue4ZK-0007dR-GE
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 22 Jul 2025 04:25:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=E9tyONLKziORYfORRDIETEO1QITP8eZuoZwa77v9DsI=; b=jA+bbUIzYX8VWRPuCCqBmSZfl6
 NlyHm3y6FcoCYfP/eMrPUa4oRZqgRj+ItkYMTuGkpL97bQqsp/TOzxmsUB1YNqT6KvJpLtEfE8EEx
 13LH9Yv6cBWW7NQ13DwuIdHv2gWlFoDjH5H/aDIurS1i4co2bGQrKyUVad6xwS3anCYw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=E9tyONLKziORYfORRDIETEO1QITP8eZuoZwa77v9DsI=; b=XR4w7icMbH2zx08HnSrr+S9xdF
 fZ55bBITZPVE/vOSpuvBhW6/siQC0X/MDiotptJ4jCmxQRVyi6W5F0biXZaeA15t8+JrYfDGdfjX7
 WWKAcvSORoZCHJrWD2o9A1XIddaPmD6veFHDe3oRcVLiUiz4dVEGWoSqExzmQWKaazE0=;
Received: from exvmail3.skhynix.com ([166.125.252.90]
 helo=invmail3.skhynix.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1ue4ZJ-0007cW-TO for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 22 Jul 2025 04:25:34 +0000
X-AuditID: a67dfc59-03fff7000000aab6-83-687f12ad647c
From: "yohan.joung" <yohan.joung@sk.com>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 22 Jul 2025 13:25:14 +0900
Message-ID: <20250722042515.1403-1-yohan.joung@sk.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <fed85e52-2965-41d0-9e73-8f2e15dbef06@kernel.org>
References: <fed85e52-2965-41d0-9e73-8f2e15dbef06@kernel.org>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrOLMWRmVeSWpSXmKPExsXC9ZZnoe4GofoMg7Vt7Banp55lsniyfhaz
 xaVF7haXd81hc2Dx2LSqk81j94LPTB6fN8kFMEdx2aSk5mSWpRbp2yVwZTzZ9o+pYAN7xao3
 39gaGJvYuhg5OSQETCTe7/8JZHOA2f+eSYCE2QQ0JP709jKD2CICWhITG/4ygtjMAqUSvc+X
 gdnCAikSk07cBLNZBFQlDpw6wA5i8wqYSdx/8owRYrymxI4v55lAbE4BO4nuHRBxIQFbiRur
 Z7BA1AtKnJz5hAVivrxE89bZQHu5gHo/skqsPH+XHWKQpMTBFTdYJjDyz0LSMwtJzwJGplWM
 Ipl5ZbmJmTnGesXZGZV5mRV6yfm5mxiBwbes9k/kDsZvF4IPMQpwMCrx8Co01GUIsSaWFVfm
 HmKU4GBWEuH9thsoxJuSWFmVWpQfX1Sak1p8iFGag0VJnNfoW3mKkEB6YklqdmpqQWoRTJaJ
 g1OqgXFOfJlKsPDpb75bDVU3rp184z5La/uXeaIHFh8oKKqadHaT20y/T09fa/4Sdbu2xs14
 2wndOvV0/Qd2/KGL5fY2CUxiXFKn7jBr9/5zR37Ou78x9rbFst5PpQyGhQt02S15p0aK35PM
 +BrC8o7tKcMGwaqGl7fbeu4G8H/z1F106vrq/LDrEX+VWIozEg21mIuKEwEG88yyOgIAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprALMWRmVeSWpSXmKPExsXCNUNlju5aofoMgyM3GC1OTz3LZPFk/Sxm
 i0uL3C0u75rDZjFh7lUmi/db7zE6sHlsWtXJ5rF7wWcmj2+3PTw+b5ILYInisklJzcksSy3S
 t0vgyniy7R9TwQb2ilVvvrE1MDaxdTFycEgImEj8eybRxcjJwSagIfGnt5cZxBYR0JKY2PCX
 EcRmFiiV6H2+DMwWFkiRmHTiJpjNIqAqceDUAXYQm1fATOL+k2dgcQkBTYkdX84zgdicAnYS
 3Tsg4kICthI3Vs9ggagXlDg58wkLxHx5ieats5knMPLMQpKahSS1gJFpFaNIZl5ZbmJmjple
 cXZGZV5mhV5yfu4mRmA4Lav9M2kH47fL7ocYBTgYlXh4FRrqMoRYE8uKK3MPMUpwMCuJ8H7b
 DRTiTUmsrEotyo8vKs1JLT7EKM3BoiTO6xWemiAkkJ5YkpqdmlqQWgSTZeLglGpg3LfCRkDz
 U7v4/p2evOJy/w/te3L6nUCU8lzJBwoz3l1lTw5w27X0+aRN/O9rwz78FNa7EV/V7t5fcPK9
 XNTmtcsy/Y3aneJ09l3JSY61t9accbUn6HvILLGwhO4+JqFg1ReWCydKrv/bs/zLrTO+aiIx
 kRmsk87LyW9eXiGRIDXZwqVp43YOJZbijERDLeai4kQAP3QtzCMCAAA=
X-CFilter-Loop: Reflected
X-Spam-Score: 0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  >On 7/21/25 13:41, yohan.joung wrote: >> pinfile is excluded
 as it operates with direct I/O > >pinfile can use buffer IO as well? only
 considered direct I/O. I'll re-upload the pinfile considering buf [...] 
 Content analysis details:   (0.4 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.4 KHOP_HELO_FCRDNS       Relay HELO differs from its IP's reverse DNS
X-Headers-End: 1ue4ZJ-0007cW-TO
Subject: Re: [f2fs-dev] [PATCH] f2fs: zone: wait for inflight dio completion,
 excluding pinned files
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org, pilhyun.kim@sk.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

>On 7/21/25 13:41, yohan.joung wrote:
>> pinfile is excluded as it operates with direct I/O
>
>pinfile can use buffer IO as well?
only considered direct I/O. I'll re-upload the pinfile considering buffered I/O
Thanks
>
>Thanks,
>
>> 
>> Signed-off-by: yohan.joung <yohan.joung@sk.com>
>> ---
>>  fs/f2fs/file.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>> 
>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
>> index 4039ccb5022c..cac8c9650a7a 100644
>> --- a/fs/f2fs/file.c
>> +++ b/fs/f2fs/file.c
>> @@ -4844,7 +4844,8 @@ static ssize_t f2fs_file_read_iter(struct kiocb *iocb, struct iov_iter *to)
>>  
>>  	/* In LFS mode, if there is inflight dio, wait for its completion */
>>  	if (f2fs_lfs_mode(F2FS_I_SB(inode)) &&
>> -	    get_pages(F2FS_I_SB(inode), F2FS_DIO_WRITE))
>> +	    get_pages(F2FS_I_SB(inode), F2FS_DIO_WRITE) &&
>> +		!f2fs_is_pinned_file(inode))
>>  		inode_dio_wait(inode);
>>  


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
