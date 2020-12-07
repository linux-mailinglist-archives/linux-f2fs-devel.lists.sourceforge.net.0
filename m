Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 124982D13F6
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  7 Dec 2020 15:48:15 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kmHoB-00071x-5y; Mon, 07 Dec 2020 14:48:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1kmHo9-00071p-WC
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Dec 2020 14:48:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vbi/SHGQaLBvFLuwgm+1i5BzNSJq6GlFs9Ym+hFSfTs=; b=b+AGR0g0tvUhEDACD/pH7zKuX6
 u3IByzIxyJiOBNWcWuCdmp/4s/FRL9RWDMp0qPLcYdfd5+85D9E7FPmQYajiE8PxdsV20uv2pcCV4
 5YKfze7jaixsGYbfBpVOJHwiHHVQQX2AIRBFitbJMYXwi362sObXf3LRWRQvoSpdGiU4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vbi/SHGQaLBvFLuwgm+1i5BzNSJq6GlFs9Ym+hFSfTs=; b=cMf5gZmaScrTFJmMVjlQWBAWn0
 8oDq9N56fzRtDxPzgn9mtvBNgM+Elv/pX1nlXSfLlgo0ZQulmVfojFwKn23XH2lSaGQb2Hnu5fhQp
 PdPduTjodXYJZJIk8UpyeJaIQOE4v/lBOuu8+omJ1wXNBXH0MO0JgxoPkBfWRYJeKpPg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kmHo5-0027Fd-Q7
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Dec 2020 14:48:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607352475;
 bh=txCVIHT/eiVw6wRqeCoicz5rdLJ5dMoXIjBRipuJPJQ=;
 h=To:References:From:Date:In-Reply-To:From;
 b=qNHkarJyg4LCdqz+WhWX+nO0bgTdd9o4RJ/+j9Eo1Ji4hcr0HzrXtz/Zzjwavnmyc
 qhwmK6+JRiK+xiu7NnlR20SLQaN4mb3MR+eul0vM3SFTqdAiJoP5FnhiLmooS1tRLe
 HsgnmAyj4Eegj9TZI2BgyWV/97sJMmgzAQDUXTbpeeLioOEBmkmf+sMrh0wydrqpyN
 NfUoO3OBEAQLl1V66F3qrdYyJaLIw6joksjC7Zc/qD+MMR4exVV4gWVp79o0uKlzl6
 4Mf9Zo6nLSuJ80Sevy+tkJ4bBwiH3aFdnK5xMNRp5tbIiKGamEIPvaYp41tqBsrH2j
 rsEzZcYQJx5rg==
To: Jack Qiu <jack.qiu@huawei.com>, linux-f2fs-devel@lists.sourceforge.net
References: <20201207120114.25642-1-jack.qiu@huawei.com>
 <20201207120114.25642-3-jack.qiu@huawei.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <eef68c5a-71c3-a617-3d1c-3f6bb6fd1de8@kernel.org>
Date: Mon, 7 Dec 2020 22:47:47 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201207120114.25642-3-jack.qiu@huawei.com>
Content-Language: en-US
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kmHo5-0027Fd-Q7
Subject: Re: [f2fs-dev] [PATCH v3 2/3] f2fs: inline: remove redundant
 FI_DATA_EXIST set
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

On 2020/12/7 20:01, Jack Qiu wrote:
> FI_DATA_EXIST has been set in recover_inline_flags, no need set in
> f2fs_recover_inline_data again. Just remove it.
> 
> Signed-off-by: Jack Qiu <jack.qiu@huawei.com>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
