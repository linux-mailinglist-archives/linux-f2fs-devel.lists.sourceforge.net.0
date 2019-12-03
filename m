Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B9010F510
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 Dec 2019 03:42:38 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iby93-0002AY-Jz; Tue, 03 Dec 2019 02:42:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <darrick.wong@oracle.com>) id 1iby91-0002AI-U6
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 Dec 2019 02:42:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9Qn7uODou/kZaLWXPXp7Ppu2r/NN46H9N8jGeyMqb0E=; b=WkZJupnNcOz1dxHAzvyGC1PxZ/
 0jOSluKlhzdLNFn8GMNuCV0Fgc2fBeFuSm7lILGOX5S/rFQnnwseC5NA3zAY6KTkTLQOdzfEiJxE2
 St06XOD9rmTaCPMusheQDoD9MW4ryfAdugWtBB4zs5lnX1evqxwWf1rfLf9RfpqE3few=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9Qn7uODou/kZaLWXPXp7Ppu2r/NN46H9N8jGeyMqb0E=; b=GSGQbflD8ldfXVVa9TEHMFPJcl
 CzSFCY9UKxKH9qcLHHqxdsi2FQjgJ9eF8mTQnqs55amuWX+OXG7czrAllfLEUQshtKNFIpVL0wtTX
 XdgAsM3gDJWZeKZ+YPxsG9BIF9adCyk5n0m2F6M9UA++0JX1RbsB4xS68+HBM5Ld4XIM=;
Received: from userp2130.oracle.com ([156.151.31.86])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iby90-005AWW-NV
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 Dec 2019 02:42:31 +0000
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xB32d0nX089443;
 Tue, 3 Dec 2019 02:42:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=9Qn7uODou/kZaLWXPXp7Ppu2r/NN46H9N8jGeyMqb0E=;
 b=BU9pOZ/d1eO2ofei6eiJo84CT+OiZNhiw5SOCuovky+z8kx9q+I24zaepKZNfbNhYys1
 IUX8B6E7zqeOXZ7ZhhNjYCvDEqFJxhFH3dhSwXf2KcjFd18oFg7q9FcmN3wZlzZBV2Y1
 P0yBsrer+XSNfdu55wOBTalUovMMroNqKpus0stmcoP+aHLpuPjEi6rDaxI5Ypk0huCe
 X4A6U6kflfQcX0BLEgZUN8CB219E9WQvXp3HwMJG+bD6z7ETPFj7gdR9JARoj57q2jl9
 Yd7YNKwd/YM4TLwIZuhg83DDPIYc9YB1qwdKRUFnRUKKLiFEqNOy721rEhikCVzxPTmW 4Q== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 2wkfuu4d58-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 03 Dec 2019 02:42:02 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xB32cqtj056504;
 Tue, 3 Dec 2019 02:40:01 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 2wnb7v4r60-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 03 Dec 2019 02:40:01 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id xB32dutc012842;
 Tue, 3 Dec 2019 02:39:57 GMT
Received: from localhost (/10.159.148.223)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 02 Dec 2019 18:39:56 -0800
Date: Mon, 2 Dec 2019 18:39:54 -0800
From: "Darrick J. Wong" <darrick.wong@oracle.com>
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <20191203023954.GB7323@magnolia>
References: <1575281413-6753-1-git-send-email-yangtiezhu@loongson.cn>
 <20191202200302.GN20752@bombadil.infradead.org>
 <357ad021-a58c-ad46-42bd-d5012126276f@loongson.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <357ad021-a58c-ad46-42bd-d5012126276f@loongson.cn>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9459
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=18
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-1912030023
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9459
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=18 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-1912030023
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iby90-005AWW-NV
Subject: Re: [f2fs-dev] [PATCH] fs: introduce is_dot_dotdot helper for
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
 linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 Tyler Hicks <tyhicks@canonical.com>, Eric Biggers <ebiggers@kernel.org>,
 linux-fscrypt@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Dec 03, 2019 at 10:07:41AM +0800, Tiezhu Yang wrote:
> On 12/03/2019 04:03 AM, Matthew Wilcox wrote:
> > On Mon, Dec 02, 2019 at 06:10:13PM +0800, Tiezhu Yang wrote:
> > > There exists many similar and duplicate codes to check "." and "..",
> > > so introduce is_dot_dotdot helper to make the code more clean.
> > The idea is good.  The implementation is, I'm afraid, badly chosen.
> > Did you benchmark this change at all?  In general, you should prefer the
> > core kernel implementation to that of some less-interesting filesystems.
> > I measured the performance with the attached test program on my laptop
> > (Core-i7 Kaby Lake):
> > 
> > qstr . time_1 0.020531 time_2 0.005786
> > qstr .. time_1 0.017892 time_2 0.008798
> > qstr a time_1 0.017633 time_2 0.003634
> > qstr matthew time_1 0.011820 time_2 0.003605
> > qstr .a time_1 0.017909 time_2 0.008710
> > qstr , time_1 0.017631 time_2 0.003619
> > 
> > The results are quite stable:
> > 
> > qstr . time_1 0.021137 time_2 0.005780
> > qstr .. time_1 0.017964 time_2 0.008675
> > qstr a time_1 0.017899 time_2 0.003654
> > qstr matthew time_1 0.011821 time_2 0.003620
> > qstr .a time_1 0.017889 time_2 0.008662
> > qstr , time_1 0.017764 time_2 0.003613
> > 
> > Feel free to suggest some different strings we could use for testing.
> > These seemed like interesting strings to test with.  It's always possible
> > I've messed up something with this benchmark that causes it to not
> > accurately represent the performance of each algorithm, so please check
> > that too.
> 
> [Sorry to resend this email because the mail list server
> was denied due to it is not plain text.]
> 
> Hi Matthew,
> 
> Thanks for your reply and suggestion. I measured the
> performance with the test program, the following
> implementation is better for various of test cases:
> 
> bool is_dot_dotdot(const struct qstr *str)
> {
>         if (unlikely(str->name[0] == '.')) {
>                 if (str->len < 2 || (str->len == 2 && str->name[1] == '.'))
>                         return true;
>         }
> 
>         return false;
> }
> 
> I will send a v2 patch used with this implementation.

Can you make it a static inline since it's such a short function?

--D

> Thanks,
> 
> Tiezhu Yang
> 
> > 
> > > +bool is_dot_dotdot(const struct qstr *str)
> > > +{
> > > +	if (str->len == 1 && str->name[0] == '.')
> > > +		return true;
> > > +
> > > +	if (str->len == 2 && str->name[0] == '.' && str->name[1] == '.')
> > > +		return true;
> > > +
> > > +	return false;
> > > +}
> > > +EXPORT_SYMBOL(is_dot_dotdot);
> > > diff --git a/fs/namei.c b/fs/namei.c
> > > index 2dda552..7730a3b 100644
> > > --- a/fs/namei.c
> > > +++ b/fs/namei.c
> > > @@ -2458,10 +2458,8 @@ static int lookup_one_len_common(const char *name, struct dentry *base,
> > >   	if (!len)
> > >   		return -EACCES;
> > > -	if (unlikely(name[0] == '.')) {
> > > -		if (len < 2 || (len == 2 && name[1] == '.'))
> > > -			return -EACCES;
> > > -	}
> > > +	if (unlikely(is_dot_dotdot(this)))
> > > +		return -EACCES;
> > >   	while (len--) {
> > >   		unsigned int c = *(const unsigned char *)name++;
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
