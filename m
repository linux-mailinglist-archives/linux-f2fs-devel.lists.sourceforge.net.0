Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD73665C7B
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Jan 2023 14:26:53 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pFb80-00089h-Qq;
	Wed, 11 Jan 2023 13:26:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pFb7z-00089X-N6
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Jan 2023 13:26:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=h5oWv92woa8dmebZ0WjOPocOKZOXDpqdschKrhVKAWM=; b=Ygz6bQ6S3v8/ZYKlbnmg2NDuJY
 ZH/4zhepcejz+8bO39j0kffpSSRDsV6PdO4zX851aZZY8w8Y+BMdIkj2CL7JGt/D2E6AnrcuWxf9W
 aqXu9Db/prtYKrCngDWjW3KgP43EloJbrFUrt/vBtpHMETjwQt5u9rnVCDI649wf3DN4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=h5oWv92woa8dmebZ0WjOPocOKZOXDpqdschKrhVKAWM=; b=B5oUStfWVau9sWoKYfGfi3yL6d
 weXZlZ5onxN4J4n9bdc1p+i7mQ86Ug9jkxZuKY7WUX7cvp1k02LfxGwOsnCG0dIU1glrmh5A0IMT8
 R+FuQuLVg4b0DaMP9c1mP3BIU52ql6cF/wH8ct8XWAstT/gUN7OiUT6ifZaqJ5i07oUw=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pFb7x-0003mq-0q for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Jan 2023 13:26:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 7D899CE1B9F;
 Wed, 11 Jan 2023 13:26:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFF97C433EF;
 Wed, 11 Jan 2023 13:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673443594;
 bh=5uTuSkRij3tB7MfvutYSz+QKNc1AdosporoRVPXJjFk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=JMUSmLn3nsr0FqbgNcr33Rn7Xr20dlr0DUAHpvqJgynkz9yh478mvYKm+3UmVEAk9
 4vcApuxn3n2I5nF/IDWPdf9TLEcvuUfS0VBKdl6tSJFa9bFmMSmLybA5In96bI7mY4
 X7fqPX4Q4zsrjZYnSQPL9m6BU+PD45mQLaJMGJlqYtXkd5ZpCXE8EGTlur+lfDM1BY
 PYg492teGQVkuFF1Ahi6n5YB1KQQkcilKAH9XLN0k2kXz5D3eNlSVlT7O8DVHk+nSN
 DOyzlPbmTLd9IMI/Yabr5zcjoGxXTaVq61ZMv6BuHJ9RY+XUhjEAfMYBGeqwgi0rFO
 bPmSiA/d4yLPQ==
Message-ID: <c22f71b9-84e5-3a1c-34a9-a29e6c31de98@kernel.org>
Date: Wed, 11 Jan 2023 21:26:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, jaegeuk@kernel.org
References: <20221220191212.58042-1-frank.li@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20221220191212.58042-1-frank.li@vivo.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/12/21 3:12, Yangtao Li wrote: > For example,
 f2fs_collapse_range(), 
 f2fs_collapse_range(), > f2fs_insert_range(),
 the functions used in f2fs_fallocate()
 > are all prefixed with f2fs_, so let's [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pFb7x-0003mq-0q
Subject: Re: [f2fs-dev] [PATCH] f2fs: add a f2fs_ prefix to punch_hole() and
 expand_inode_data()
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/12/21 3:12, Yangtao Li wrote:
> For example, f2fs_collapse_range(), f2fs_collapse_range(),
> f2fs_insert_range(), the functions used in f2fs_fallocate()
> are all prefixed with f2fs_, so let's keep the name consistent.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
