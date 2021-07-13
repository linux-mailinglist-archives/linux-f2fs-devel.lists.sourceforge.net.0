Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 078CC3C6893
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Jul 2021 04:36:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m38H8-0002Q7-GN; Tue, 13 Jul 2021 02:35:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <changfengnan@vivo.com>) id 1m38H6-0002Py-QD
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 13 Jul 2021 02:35:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ox+rTuaPS6p6tJGdbW3WReVUK1Yy2yM3MfAnEQf78bg=; b=OdjtfoKAYz/T9kbQfSMRlczmq7
 HiTtH5apDITvndehJd9HMuAtAjJa9B6oPR9s1prsbs+gIPeLJy8/xcL+29t+HrTxaxXflegWwsRYp
 EjcJbKQWxPnlhlUk7V7zEahV9ELulztz05Nzn5KU1tmykqa8yV1iykzmdSfNoCYhyHo4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ox+rTuaPS6p6tJGdbW3WReVUK1Yy2yM3MfAnEQf78bg=; b=QS95Sy68NDTzOHiRpYO51QhRJU
 uZXEjQ1+9ftz+AcsEWv5+k8oYI0M/G+FVoVgZziz/gfzjxsN2C5/dgkqoyXSJz1ZfG+mH+loUWEGL
 jN68R3HabsVi72ZKZr+1lG1bf4lAHwb/+uomqrIL4chR5qEi5KqLxe4IXsoxNivLHpfg=;
Received: from mail-m121144.qiye.163.com ([115.236.121.144])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m38H0-006ROL-Rl
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 13 Jul 2021 02:35:56 +0000
DKIM-Signature: a=rsa-sha256;
 b=efBHIzCXlSPeKuv28R7315fHnNLtv8ZJ1aGe2fsSgVmNxfeCFYMqCHpW2C9vJ9Jz6vY7xgQ/vUQyV3wv9/4orl2yUqIpp8zNp6Q5LcLmYFFzMwcjnFFPK/vBX/+eONHMZkmIWAjaOGoKbBpjCkY6Ze8tgnitmUvFq6+ufUxo5G8=;
 c=relaxed/relaxed; s=default; d=vivo.com; v=1;
 bh=Ox+rTuaPS6p6tJGdbW3WReVUK1Yy2yM3MfAnEQf78bg=;
 h=date:mime-version:subject:message-id:from;
Received: from [172.25.44.145] (unknown [58.250.176.229])
 by mail-m121144.qiye.163.com (Hmail) with ESMTPA id A8BF9AC012D;
 Tue, 13 Jul 2021 10:35:42 +0800 (CST)
To: jaegeuk@kernel.org, chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net
References: <20210622115059.24860-1-changfengnan@vivo.com>
From: Fengnan Chang <changfengnan@vivo.com>
Message-ID: <7e7d1dec-d245-8451-7a08-20c0c937c21b@vivo.com>
Date: Tue, 13 Jul 2021 10:35:42 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210622115059.24860-1-changfengnan@vivo.com>
Content-Language: en-US
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZGUlPHVZJQh5JQk0dTh4ZShpVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
 hOSFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Pyo6Dgw*Gj9WCBUuEi4KAkw3
 EiJPChJVSlVKTUlNSk9ITE9ISk1IVTMWGhIXVRgTGhUcHR4VHBUaFTsNEg0UVRgUFkVZV1kSC1lB
 WU5DVUlOS1VKTE1VSUlCWVdZCAFZQUlKQk03Bg++
X-HM-Tid: 0a7a9db85b9ab039kuuua8bf9ac012d
X-Spam-Score: -1.3 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [115.236.121.144 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [115.236.121.144 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.1 DKIM_INVALID           DKIM or DK signature exists, but is not valid
 -1.5 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1m38H0-006ROL-Rl
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: compress: remove unneeded read when
 rewrite whole cluster
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
Cc: Chao Yu <yuchao0@huawei.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Jaegeuk:
	Any comments about this version?

On 2021/6/22 19:50, Fengnan Chang wrote:
> when we overwrite the whole page in cluster, we don't need read original
> data before write, because after write_end(), writepages() can help to
> load left data in that cluster.
> 
> Signed-off-by: Fengnan Chang <changfengnan@vivo.com>
> Signed-off-by: Chao Yu <yuchao0@huawei.com>
> Acked-by: Chao Yu <yuchao0@huawei.com>
> ---
>   fs/f2fs/data.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 3a01a1b50104..2aeb1196cd5f 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -3328,6 +3328,9 @@ static int f2fs_write_begin(struct file *file, struct address_space *mapping,
> 
>   		*fsdata = NULL;
> 
> +		if (len == PAGE_SIZE)
> +			goto repeat;
> +
>   		ret = f2fs_prepare_compress_overwrite(inode, pagep,
>   							index, fsdata);
>   		if (ret < 0) {
> --
> 2.29.0
> 
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
