Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADFB11A4EB
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Dec 2019 08:12:21 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iewAS-0004LU-Iy; Wed, 11 Dec 2019 07:12:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <gaoxiang25@huawei.com>) id 1iewAQ-0004LL-Ud
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Dec 2019 07:12:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:CC:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dSCquZ3imb87SN/cx+i0d8v1B8f41qO3qjgawFgGPxU=; b=cJbtjZSDAQxFlYfwkDeury+goZ
 g2P+gI/+2yd6JKCovt0nZLaGDuN+V9I5G+VPmB+rArzEgnAOjTSmdZVRTAWtcYwLBZFWobWjwV1q1
 8qBypoFUvIzdojulhnjghQ5eOacQL/lmBPtHThOS+VrR8FK/R2oBv99z3iq0fTx7+lUI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:CC:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dSCquZ3imb87SN/cx+i0d8v1B8f41qO3qjgawFgGPxU=; b=hw556FhH90uA7W1uf00zeJDHnk
 UU9nL4Vo68S7rdNYUQ5HPPqqRVkwuMJZTY15LLysyZ29gcrkdo3RX43Ks/gvDbFplhaWDz3HoYoZN
 sFIa7Y1ZdllYgIz1BQP5VOgGMnMRRIuilZEKTQ+1GAFNUgMLFK2SFYS3lMjX4EzKkkgU=;
Received: from szxga08-in.huawei.com ([45.249.212.255] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iewAP-000dwO-46
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Dec 2019 07:12:14 +0000
Received: from DGGEMM403-HUB.china.huawei.com (unknown [172.30.72.56])
 by Forcepoint Email with ESMTP id 4ACD0B87F982C67764B5;
 Wed, 11 Dec 2019 15:12:02 +0800 (CST)
Received: from dggeme762-chm.china.huawei.com (10.3.19.108) by
 DGGEMM403-HUB.china.huawei.com (10.3.20.211) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 11 Dec 2019 15:12:01 +0800
Received: from architecture4 (10.160.196.180) by
 dggeme762-chm.china.huawei.com (10.3.19.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1713.5; Wed, 11 Dec 2019 15:12:01 +0800
Date: Wed, 11 Dec 2019 15:17:11 +0800
From: Gao Xiang <gaoxiang25@huawei.com>
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <20191211071711.GA231266@architecture4>
References: <1576030801-8609-1-git-send-email-yangtiezhu@loongson.cn>
 <20191211024858.GB732@sol.localdomain>
 <febbd7eb-5e53-6e7c-582d-5b224e441e37@loongson.cn>
 <20191211044723.GC4203@ZenIV.linux.org.uk>
 <4a90aaa9-18c8-f0a7-19e4-1c5bd5915a28@loongson.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4a90aaa9-18c8-f0a7-19e4-1c5bd5915a28@loongson.cn>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [10.160.196.180]
X-ClientProxiedBy: dggeme715-chm.china.huawei.com (10.1.199.111) To
 dggeme762-chm.china.huawei.com (10.3.19.108)
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1iewAP-000dwO-46
Subject: Re: [f2fs-dev] [PATCH v5] fs: introduce is_dot_or_dotdot helper for
 cleanup
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
Cc: ecryptfs@vger.kernel.org, "Theodore Y. Ts'o" <tytso@mit.edu>,
 "Darrick J. Wong" <darrick.wong@oracle.com>, linux-kernel@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>, Tyler Hicks <tyhicks@canonical.com>,
 Eric Biggers <ebiggers@kernel.org>, linux-fscrypt@vger.kernel.org,
 Al Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Dec 11, 2019 at 02:38:34PM +0800, Tiezhu Yang wrote:
> On 12/11/2019 12:47 PM, Al Viro wrote:
> > On Wed, Dec 11, 2019 at 11:59:40AM +0800, Tiezhu Yang wrote:
> > 
> > > static inline bool is_dot_or_dotdot(const unsigned char *name, size_t len)
> > > {
> > >          if (len == 1 && name[0] == '.')
> > >                  return true;
> > > 
> > >          if (len == 2 && name[0] == '.' && name[1] == '.')
> > >                  return true;
> > > 
> > >          return false;
> > > }
> > > 
> > > Hi Matthew,
> > > 
> > > How do you think? I think the performance influence is very small
> > > due to is_dot_or_dotdot() is a such short static inline function.
> > It's a very short inline function called on a very hot codepath.
> > Often.
> > 
> > I mean it - it's done literally for every pathname component of
> > every pathname passed to a syscall.
> 
> OK. I understand. Let us do not use the helper function in fs/namei.c,
> just use the following implementation for other callers:
> 
> static inline bool is_dot_or_dotdot(const unsigned char *name, size_t len)
> {
>         if (len >= 1 && unlikely(name[0] == '.')) {


And I suggest drop "unlikely" here since files start with prefix
'.' (plus specical ".", "..") are not as uncommon as you expected...


Thanks,
Gao Xiang


>                 if (len < 2 || (len == 2 && name[1] == '.'))
>                         return true;
>         }
> 
>         return false;
> }
> 
> Special thanks for Matthew, Darrick, Al and Eric.
> If you have any more suggestion, please let me know.
> 
> Thanks,
> 
> Tiezhu Yang
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
