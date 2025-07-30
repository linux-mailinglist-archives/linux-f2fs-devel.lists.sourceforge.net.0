Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A10B1638B
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 30 Jul 2025 17:21:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T373MNsiDInLNxbv2F5Oem9AAxaPwGUHM08vr0PsN80=; b=kDcprvAmqo0Za8JcdlhlBEdY0z
	9oRYRRnzg/0NJUGM12qDJiY9+Vo0OmSI6qpSU024dFpv/+jjyzZtkp0xp/T9uf3PU4emsAkWehwFP
	gM/ajfE64bpBpkbJSgKfzlHafICpdivia84jmwNgjtCxt+i31Yro8n4CYAzdfCVQVfVw=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uh8cF-0000Tv-PK;
	Wed, 30 Jul 2025 15:21:15 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <axboe@kernel.dk>) id 1uh8cB-0000To-VN
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 30 Jul 2025 15:21:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dGvN81tK3SiKuUwwOdxVCQ6vX1YLyW1gSNQPEFsAu5s=; b=IiplDZITn+WhAf5lSka1JS+kCw
 WfJK5ohGS3n1+0niEhAPgEHkjrRcZazNwHc+A1FvdJPnkW4Id0eNUZcumB1OjttqLTc2hLqDJPuPa
 utSlby6D1+spGuo+kEZuSgGBlRAk84BNvJoOZnVnhnbcJEnm87a54NeIbHzxhF3Sfclw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dGvN81tK3SiKuUwwOdxVCQ6vX1YLyW1gSNQPEFsAu5s=; b=ZdZBXVKDJju2q23I3gqii44eXZ
 pRvv8dD5pa7Ls1u8YabuEHm4YW/1vEmRgR8XXWn+nOC/uoQloBOcGPYUootTkaJGWoHuZOJ8NMFWV
 3x9EeaP+BHt4qWOLnPSJgRAG1nP7VJzuJRBsZQaAVgq+zcS/0AK5wGWkm/ZbcsiBSDa0=;
Received: from mail-io1-f51.google.com ([209.85.166.51])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uh8c9-0002C0-Pv for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 30 Jul 2025 15:21:11 +0000
Received: by mail-io1-f51.google.com with SMTP id
 ca18e2360f4ac-87c28e9e7ddso89509239f.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 30 Jul 2025 08:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1753888857; x=1754493657;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dGvN81tK3SiKuUwwOdxVCQ6vX1YLyW1gSNQPEFsAu5s=;
 b=el52P58Bjf+bpVD8kap53JMEak6V4dLSANoh7QLUktMNbN5Ty8SE/jx/yTFfVRwuiu
 UjDckKFDq2A4KUihMkd5A3165Hy4Yvw6yS+qCVPA8iI34QKQAIv94EtuQukEYW7VJ8xf
 8mGPbZv7ujFLT48gtBypBmbu2RNu3PFKiIppob0M2qBr6NKDoRsN+YEEIA1WUANFeIAU
 8oKsgPfIv2bUDo8X6Sd+yKeGi7ZBPhnZG+ZCw0qWH6oMSWN2d9B4qNKVZQG3Zkc09JeP
 w4+ni9cNZiH1tRn1+rDXtxQuTG+e6UQFxjmMDzZNhzOJcxkntDof7nuCb6CZSa7nkWrO
 eURA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753888857; x=1754493657;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dGvN81tK3SiKuUwwOdxVCQ6vX1YLyW1gSNQPEFsAu5s=;
 b=Mbc9Im7F+9ybUS9GYRXZnx9RDAfaiYiYrRM5SDT25gIY9ZuK6r1QJ2LlivVq38dUEV
 Hy2nlzMcSNV65yaHS2/vSihuSMXeybl5lulveNIOTfvgFgHIdv3PoNZ5LDwj040LfWBb
 ttSs/LbQgFNoLdzXSpHXCxmvclpZCYJY1i8s2apGLnZN4YdHIZMsajJG1oX3nlwf/FGs
 GXDi3keSWMbU6cBM9cMmF5WZKg1n2OzsQKapzckxxIUxwe/NmRT3TCUOsWwCEe+nmu7e
 RAeVfoEGnWe+sKp24vMBewaRnUo2nOWZoBN+pLfX76wE/VJGhF3+kn0G8bLlAuoLTh1L
 rqYA==
X-Gm-Message-State: AOJu0YxnMiOzANKccg1+5f8dIXBbR/F3cOu+m/OMplfI2WBZaVVYKcNE
 0MQEBNpEnnUtV3l1OWpocnZLBYIfTBHFK1n0T53fyumGdSV3jBDhS9cx1xragCgMXCV4ZXy/EiC
 Ktx2B
X-Gm-Gg: ASbGncupbsonD4eXYH5np7oQs18jvJaJtrt01qbRdf3tDrQ38mDKQfAddtGvWzyc8sV
 YA3l1fHvQUF6CR4SHZ9f41Agu6TCMoBI6zGxaCSC4LPByX8nsBekPlUCWKRZLezT7VAw4EoJAwB
 HDyvIc+8gTWws9kwBkqAqdMe8w9iLBHQBVXUQfk6gH3fPuNKLf0X9ejTLXklJiiEoaTRy+ex7fh
 /0c/8xTpWGElDuVyC1Go43ZUJkBEQT26hszvdGiCPRWdC13RrEH+uOWtl9zOjuynvYIDM3u3Sca
 AglQ6OK058vRX7BonhpgFYjLsPKAuVvNvcaIMrRK/yLjawxnYCFMiM56XNhRF1xzKnC5BS4zf7V
 2XRnBtRLYMH6dQbCr4A==
X-Google-Smtp-Source: AGHT+IEYoOQssgXqmLYl6Ge/P/+WMJXz1cstrJMMaV4kH+gwrSXxse4HeKT5xLsNZC2QjL8pj4jG4g==
X-Received: by 2002:a05:6e02:2388:b0:3e2:9253:a19 with SMTP id
 e9e14a558f8ab-3e3f624cea4mr59279225ab.13.1753888857506; 
 Wed, 30 Jul 2025 08:20:57 -0700 (PDT)
Received: from [192.168.1.116] ([96.43.243.2])
 by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-508c93751a4sm3317700173.96.2025.07.30.08.20.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jul 2025 08:20:56 -0700 (PDT)
Message-ID: <1b420389-d46b-48ef-aa49-585d84e2710f@kernel.dk>
Date: Wed, 30 Jul 2025 09:20:56 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: hanqi <hanqi@vivo.com>, Chao Yu <chao@kernel.org>, jaegeuk@kernel.org
References: <20250725075310.1614614-1-hanqi@vivo.com>
 <d258ab6d-a97a-4232-bf90-5afedd5cccb2@kernel.org>
 <e1a1dbfe-165f-4cb3-9d5b-8ac4ba61265e@vivo.com>
 <087f7937-20b5-4151-8a3f-5b6b2b045b41@kernel.org>
 <b1cf56a6-d23d-40ca-acaa-07944140b1b5@vivo.com>
From: Jens Axboe <axboe@kernel.dk>
Content-Language: en-US
In-Reply-To: <b1cf56a6-d23d-40ca-acaa-07944140b1b5@vivo.com>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 7/28/25 2:28 AM, hanqi wrote: > ? 2025/7/28 16:07, Chao
 Yu ??: >> On 7/28/25 16:03, hanqi wrote: >>> ? 2025/7/28 15:38, Chao Yu ??:
 >>> >>>> On 7/25/25 15:53, Qi Han wrote: >>>>> Jens has already c [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.51 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1uh8c9-0002C0-Pv
Subject: Re: [f2fs-dev] [PATCH] f2fs: f2fs supports uncached buffered I/O
 read
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 7/28/25 2:28 AM, hanqi wrote:
> ? 2025/7/28 16:07, Chao Yu ??:
>> On 7/28/25 16:03, hanqi wrote:
>>> ? 2025/7/28 15:38, Chao Yu ??:
>>>
>>>> On 7/25/25 15:53, Qi Han wrote:
>>>>> Jens has already completed the development of uncached buffered I/O
>>>>> in git [1], and in f2fs, uncached buffered I/O read can be enabled
>>>>> simply by setting the FOP_DONTCACHE flag in f2fs_file_operations.
>>>> IIUC, we may suffer lock issue when we call pwritev(.. ,RWF_DONTCACHE)?
>>>> as Jen mentioned in below path, right?
>>>>
>>>> soft-irq
>>>> - folio_end_writeback()
>>>>    - filemap_end_dropbehind_write()
>>>>     - filemap_end_dropbehind()
>>>>      - folio_unmap_invalidate()
>>>>       - lock i_lock
>>>>
>>>> Thanks,
>>> That's how I understand it.
>> So I guess we need to wait for the support RWF_DONTCACHE on write path, unless
>> you can walk around for write path in this patch.
>>
>> Thanks,
> 
> I think the read and write paths can be submitted separately.
> Currently, uncached buffered I/O write requires setting the
> FGP_DONTCACHE flag when the filesystem allocates a folio. In
> f2fs, this is done in the following path:
> 
> - write_begin
>  - f2fs_write_begin
>   - __filemap_get_folio
>   As I understand it, if we don't set the FGP_DONTCACHE flag here, this
> issue shouldn't occur.

It won't cause an issue, but it also won't work in the sense that the
intent is that if the file system doesn't support DONTCACHE, it would
get errored at submission time. Your approach would just ignore the flag
for writes, rather than return -EOPNOTSUPP as would be expected.

You could potentially make it work just on the read side by having the
f2fs write submit side check DONTCACHE on the write side and error them
out.

-- 
Jens Axboe


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
