Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B684A85C9
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  4 Sep 2019 16:54:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i5WgA-0005Oa-VA; Wed, 04 Sep 2019 14:54:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dan.carpenter@oracle.com>) id 1i5Wg9-0005OA-CW
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 04 Sep 2019 14:54:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9aPoIL9pO6gE62BiC2uWQJGmxnxCOgq0bXNSgJqqMCA=; b=MQa22rDf8vkkUcjPKjME7a0VQ0
 CGQ5TwjeLnvjaH1G4eOJxXJvZVqXlzdTKIaF677pCKkYtTOQAMMptDpOwzUpzoLSJ6cOWKIgfzb+e
 YthgPjcWjgdItDMV/phfORPdeXZvCgB52vU0SOVzXSFuDax+id76GvBEqafNW0kE6qIM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9aPoIL9pO6gE62BiC2uWQJGmxnxCOgq0bXNSgJqqMCA=; b=EG5XjB80mCN0pP7WrbWQ9OB21z
 3RMiCMXIjzAIcevaNenBbtsMDcQMs6UoiF/DTGPQiGZ612/dqNQaYRDZx2GZlurpvZj4485sHHGzu
 O9gcu58KA4+0oa/r6wkTxnPgSng8ZyjYcBm6NJUwES7KUSjeaUF6UBya9FZFyS6Oh2CE=;
Received: from aserp2120.oracle.com ([141.146.126.78])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i5Wg8-00A0CJ-8K
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 04 Sep 2019 14:54:37 +0000
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x84CiAdp066772;
 Wed, 4 Sep 2019 12:44:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=9aPoIL9pO6gE62BiC2uWQJGmxnxCOgq0bXNSgJqqMCA=;
 b=Bv1cwKsmB3/3oIIt3Xq72s4af6N5blG4vdUcPRy9avry5cH9R+UpnoDry6Egy5idgZXR
 30QOl4K3JrqotRG5snEU/amCimwC5oNrxi4tHxxfxyhRXTX6Wk1SFT7b3R9dcznFtkZZ
 bB4k+qgLVTlZSxp9oFGmSZru9EuZdGnyM5thqNkRNN2QVcKFafrbsAqk87jXSUNOhCMW
 AYfIl6oEqxuXI1Exq1r+YF7xuJsOsx+9KyQ9rc4WEDmyEObg5AbV70NgOhNxqn94RzbJ
 pHinQ1Ps+4l1Z1+DgOXFV8x5X65KrRHRPpZqGCngPV2myjaYBgXnP5XARlktyCO94M7S BQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 2utdcyg1xe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 04 Sep 2019 12:44:35 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x84ChHHa096176;
 Wed, 4 Sep 2019 12:44:35 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3030.oracle.com with ESMTP id 2usu51tkpk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 04 Sep 2019 12:44:34 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x84CiWFP006982;
 Wed, 4 Sep 2019 12:44:33 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 04 Sep 2019 05:44:32 -0700
Date: Wed, 4 Sep 2019 15:44:24 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20190904124424.GA3115@kadam>
References: <20190904100239.GC7007@mwanda>
 <29accb39-1ed7-ab3f-4783-9a07836db8e3@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <29accb39-1ed7-ab3f-4783-9a07836db8e3@huawei.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9369
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=936
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1909040127
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9369
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1909040127
X-Spam-Score: -0.3 (/)
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
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1i5Wg8-00A0CJ-8K
Subject: Re: [f2fs-dev] [PATCH] f2fs: signedness bug in
 f2fs_fname_setup_ci_filename()
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, kernel-janitors@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Sep 04, 2019 at 07:43:07PM +0800, Chao Yu wrote:
> On 2019/9/4 18:02, Dan Carpenter wrote:
> > The error handling doesn't work because "cf_name->len" is unsigned.
> 
> Dan, thanks for catching this, would you mind merging this into original patch,
> since it's still in the dev branch. :)

I don't mind if you fold it into the original.  That's fine.

regards,
dan carpenter



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
