Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8A91C4BBD
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  5 May 2020 04:08:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jVn0w-00005w-2A; Tue, 05 May 2020 02:08:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1jVn0u-00005h-KX
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 05 May 2020 02:08:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MkL3QhofGSlLa+UEfqgb99bJ6h+2kfZnPZoDW1sRSKI=; b=PYX9cDXpqV5lGTT0qY6PxlxuoZ
 XNnQwDNpF1iXI7mKvLJA5Nvb1190SeO5FvSsDXlWRLjZUT5oRC4+NTeompbwFonyFrlV3PEkqjEUs
 qcqHPD0oFHwi4yixvMwagVIH+pD+yXvaD4WAXZS+8odMt7/kFk4br0qjFD3dze3Yt5X4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MkL3QhofGSlLa+UEfqgb99bJ6h+2kfZnPZoDW1sRSKI=; b=CCcN/zOZ3Ua5oGWxDnhzm0Wu0V
 oTBA2qgqoagY38Sc1m0J5gl0fUzBFEinoEbC+GIaO0zNZd1oRuC4NIupTohQ98CW7oU8S+ZBR+BQR
 UZ5ASa62pWWqo/ZSnq6vAXWXn452BMtd1+90BFfS1jQ+q4vidVRb1RtfFfYjxgzUSkw4=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jVn0s-007gp5-NM
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 05 May 2020 02:08:52 +0000
Received: from [192.168.0.107] (unknown [58.213.210.203])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 96F2F206D7;
 Tue,  5 May 2020 02:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588644525;
 bh=WA4NF4Zrsn/AZscHkiK0AuxGMzZiCnAsbzhY8KUi4w0=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=fMN8n8tRQXf1Xn4ZeO8JjyvlKub1XKr/IMBo7ozbkZDKaAMKH29LkrAWe0quuLyIM
 Orp6jaTKVFgbxlOCLm+liNy9gek39BAcEW2E82h3Cjj7RJYcH0NiWAw8jLZFDuGtQK
 qtMDBUCKIlx0o3D2eh15JtbooNKPgRjm4TWNW7I0=
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20200504143039.155644-1-jaegeuk@kernel.org>
 <7177aab9-630e-e077-7005-0023c93134b3@kernel.org>
From: Chao Yu <chao@kernel.org>
Message-ID: <5dadaf04-ef9e-f6a8-c132-8fa072e8e6fe@kernel.org>
Date: Tue, 5 May 2020 10:08:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <7177aab9-630e-e077-7005-0023c93134b3@kernel.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1jVn0s-007gp5-NM
Subject: Re: [f2fs-dev] [PATCH] f2fs: change maximum zstd compression buffer
 size
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020-5-5 9:52, Chao Yu wrote:
> On 2020-5-4 22:30, Jaegeuk Kim wrote:
>> From: Daeho Jeong <daehojeong@google.com>
>>
>> Current zstd compression buffer size is one page and header size less
>> than cluster size. By this, zstd compression always succeeds even if
>> the real compression data is failed to fit into the buffer size, and
>> eventually reading the cluster returns I/O error with the corrupted
>> compression data.
>
> What's the root cause of this issue? I didn't get it.
>
>>
>> Signed-off-by: Daeho Jeong <daehojeong@google.com>
>> ---
>>  fs/f2fs/compress.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
>> index 4c7eaeee52336..a9fa8049b295f 100644
>> --- a/fs/f2fs/compress.c
>> +++ b/fs/f2fs/compress.c
>> @@ -313,7 +313,7 @@ static int zstd_init_compress_ctx(struct compress_ctx *cc)
>>      cc->private = workspace;
>>      cc->private2 = stream;
>>
>> -    cc->clen = cc->rlen - PAGE_SIZE - COMPRESS_HEADER_SIZE;
>> +    cc->clen = ZSTD_compressBound(PAGE_SIZE << cc->log_cluster_size);

Max size of intermediate buffer has been set as below?

- zstd_init_compress_ctx
  - params = ZSTD_getParams(F2FS_ZSTD_DEFAULT_CLEVEL, cc->rlen, 0)
  - ZSTD_CStreamWorkspaceBound(params.cParams)
   - outBuffSize = ZSTD_compressBound(blockSize) + 1;
   - workspace_size = ... + outBuffSize + ...
  - workspace = f2fs_kvmalloc(workspace_size)

>
> In my machine, the value is 66572 which is much larger than size of dst buffer,
> so, in where we can tell the real size of dst buffer to zstd compressor?
> Otherwise, if compressed data size is larger than dst buffer size, when we flush
> compressed data into dst buffer, we may suffer overflow.
>
>>      return 0;
>>  }
>>
>> @@ -330,7 +330,7 @@ static int zstd_compress_pages(struct compress_ctx *cc)
>>      ZSTD_inBuffer inbuf;
>>      ZSTD_outBuffer outbuf;
>>      int src_size = cc->rlen;
>> -    int dst_size = src_size - PAGE_SIZE - COMPRESS_HEADER_SIZE;
>> +    int dst_size = cc->clen;
>>      int ret;
>>
>>      inbuf.pos = 0;
>>
>
>
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
