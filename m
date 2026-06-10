Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +R4HHJhJKWraTgMAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 10 Jun 2026 13:25:12 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A65FA668BFB
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 10 Jun 2026 13:25:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=QKJKmpN2;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=AOrsvofj;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b="crXlMcS/";
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=M3nfnVUr;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cMdWLbWp6SHqphJ8pVImG2uUMkTf4DqrU+sAk4ZX+gg=; b=QKJKmpN2Nofpv+Ux1XrvDOt2zr
	2sTGwmYGjGt1Djxhgo9UdewRnZnWwMoWhqLFe+/HJfMMmH8pLvDaPomOgErf6t6bj2+p9E4Ua5cF/
	K3cmOxweyGSUqf8zpDVrUufh8dlysOnnmyP1/N/22I816DiN3Tgti/WRuA7UBS2HGo6o=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wXH3J-0001bD-Oy;
	Wed, 10 Jun 2026 11:24:58 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1wXH3G-0001an-98
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 10 Jun 2026 11:24:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=68rnEy2Ju2fivHQsmk6rwdh19LpwaE7dKyVpigYKIjQ=; b=AOrsvofjKMTztzbL0IgNa44woN
 rpMqW3HVv6KrnYgWKXSE39f7V2N2bU+LKbxBWpOSWmYWaCYLkeAXrL4TDakiPPFmOAQ1lpGSNHs1h
 ybYeD0L7llGWjATHOF3WuKDah4//FwAfKHvv1MYlxQZN8QdFRKPMrGEwdmcoj8pY4S9g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=68rnEy2Ju2fivHQsmk6rwdh19LpwaE7dKyVpigYKIjQ=; b=crXlMcS/LCrWRytqrxak6jZCOG
 HpT3OOt473Wo9N2sG0tOyOzJVXQJaovq1W0LzlfAK6Z1WNMU15zlW7vHOzlCcbuhA7KPGgbfZMtr+
 0UJLM/Oc3hAVOtiHjiA5iaBsATLEuCfFoY2RmUHnAfW1+0xnogrt/QO0GkFPVEI5dYJ4=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wXH3C-0007iO-56 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 10 Jun 2026 11:24:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 54EEE43432;
 Wed, 10 Jun 2026 11:24:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E87841F00898;
 Wed, 10 Jun 2026 11:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1781090680;
 bh=68rnEy2Ju2fivHQsmk6rwdh19LpwaE7dKyVpigYKIjQ=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To;
 b=M3nfnVUrNRW4KZj4XJfEKqPrC4ZvUReob2xv+/ExNxyUUptYsBuHiCg3Mrd87+RaI
 yZOg4YtFr44fcSgw4+2p4YTJVbCuVDWWsW6aPAnt0GHwlakZ5Vu0W6VGZL0ykRDO4U
 DvE4Jyikv0lYK9LLCoKpOpwBRMCwmons6lt9IO3eMsQjA1B+RL+O/AuQvJBolQ6axc
 qkUNghY01Ru5W++Xiu1LtYFgR6PFpVMeDL3jS4zkv6XFkhnQrk2irsdkmg1u6V6SxP
 Dj4MhsAt2mA6CtsTZ8WO8QRVoTPktakAma0o7oC4UbFklAr9DT6+vecB9hkE+xfBVw
 bc5N/IK+sLxWA==
Message-ID: <d3cc94c7-ac79-4789-9adb-24d5947c54e6@kernel.org>
Date: Wed, 10 Jun 2026 19:24:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>, Wenjie Qi <qwjhust@gmail.com>
References: <20260522061206.2405336-1-qiwenjie@xiaomi.com>
 <aiiyiBkRYm2XgCtZ@google.com>
Content-Language: en-US
In-Reply-To: <aiiyiBkRYm2XgCtZ@google.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 6/10/26 08:40, Jaegeuk Kim wrote: > On 05/22, Wenjie Qi
 wrote: >> io_uring can pass a per-I/O write stream through
 kiocb->ki_write_stream, 
 >> and block direct I/O propagates that value to bio->bi_w [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1wXH3C-0007iO-56
Subject: Re: [f2fs-dev] [PATCH] f2fs: honor per-I/O write streams for direct
 writes
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
Cc: qiwenjie@xiaomi.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	MID_RHS_MATCH_TO(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:qwjhust@gmail.com,m:qiwenjie@xiaomi.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_MIXED(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[chao@kernel.org]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A65FA668BFB

On 6/10/26 08:40, Jaegeuk Kim wrote:
> On 05/22, Wenjie Qi wrote:
>> io_uring can pass a per-I/O write stream through kiocb->ki_write_stream,
>> and block direct I/O propagates that value to bio->bi_write_stream.
>>
>> F2FS added FDP stream mapping for DATA writes, but its direct write
>> submit hook always rewrites bio->bi_write_stream from the inode write
>> hint and F2FS temperature. As a result, a direct write with an explicit
>> io_uring write_stream is submitted to the F2FS-selected stream instead
>> of the user-requested stream.
>>
>> Validate an explicit write stream before starting F2FS direct I/O, pass
>> the kiocb through the iomap private pointer, and preserve the per-I/O
>> stream in the direct write bio. When no per-I/O stream is supplied, keep
>> using the existing F2FS temperature-to-stream mapping.
>>
>> Fixes: 42f7a7a50a33 ("f2fs: map data writes to FDP streams")
>> Signed-off-by: Wenjie Qi <qiwenjie@xiaomi.com>
>> ---
>>  fs/f2fs/file.c | 30 +++++++++++++++++++++++++++---
>>  1 file changed, 27 insertions(+), 3 deletions(-)
>>
>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
>> index 71385ca4163d..20d6e7ab7416 100644
>> --- a/fs/f2fs/file.c
>> +++ b/fs/f2fs/file.c
>> @@ -5074,17 +5074,36 @@ static int f2fs_dio_write_end_io(struct kiocb *iocb, ssize_t size, int error,
>>  	return 0;
>>  }
>>  
>> +static bool f2fs_valid_write_stream(struct f2fs_sb_info *sbi, u8 write_stream)
>> +{
>> +	int i;
>> +
>> +	if (!write_stream)
>> +		return true;
>> +	if (!f2fs_is_multi_device(sbi))
>> +		return write_stream <= bdev_max_write_streams(sbi->sb->s_bdev);
>> +
>> +	for (i = 0; i < sbi->s_ndevs; i++)
>> +		if (write_stream > bdev_max_write_streams(FDEV(i).bdev))
>> +			return false;
>> +	return true;
>> +}
>> +
>>  static void f2fs_dio_write_submit_io(const struct iomap_iter *iter,
>>  					struct bio *bio, loff_t file_offset)
>>  {
>>  	struct inode *inode = iter->inode;
>>  	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
>> +	struct kiocb *iocb = iter->private;
>>  	enum log_type type = f2fs_rw_hint_to_seg_type(sbi, inode->i_write_hint);
>>  	enum temp_type temp = f2fs_get_segment_temp(sbi, type);
>>  
>>  	bio->bi_write_hint = f2fs_io_type_to_rw_hint(sbi, DATA, temp);
>> -	bio->bi_write_stream =
>> -		f2fs_io_type_to_write_stream(bio->bi_bdev, DATA, temp);
>> +	if (iocb->ki_write_stream)
>> +		bio->bi_write_stream = iocb->ki_write_stream;
>> +	else
>> +		bio->bi_write_stream =
>> +			f2fs_io_type_to_write_stream(bio->bi_bdev, DATA, temp);
> 
> Let me apply as below.
> 
>         bio->bi_write_stream =
> +               iocb->ki_write_stream ? iocb->ki_write_stream :
>                 f2fs_io_type_to_write_stream(bio->bi_bdev, DATA, temp);

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
