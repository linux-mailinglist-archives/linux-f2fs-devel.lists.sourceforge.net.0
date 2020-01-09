Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B50B7135206
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  9 Jan 2020 04:41:05 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ipOgw-0002kL-FV; Thu, 09 Jan 2020 03:41:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <martin.petersen@oracle.com>) id 1ipOgu-0002k0-HP
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 09 Jan 2020 03:41:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:In-Reply-To:
 Date:References:From:Subject:Cc:To:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=d286TUXfSVAxHnl9z2DyeRiz3PyfuYs/FVhffcmdrHI=; b=EbTW7L47MuX+v4r+ilHzLqScTW
 wkx07cABVec7bV+XZsbkDo7As07PLr58XBcRppFfA5gOUuv4v9z34bW7qi3QQj5Szc4dS7WVC6n+C
 3iDgtFOfousP7SGypB/oENyHFb77EUU1TplG3XQRUYW9MkPwzR894RM0P2f5gP/uSslM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:From:
 Subject:Cc:To:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=d286TUXfSVAxHnl9z2DyeRiz3PyfuYs/FVhffcmdrHI=; b=kCAkzIgaP1oUE9eeoJjsGH4IYv
 J11HPxlgb5y8t0mv7CsNwGZ+ZM6tvE695NOapnYqXWxcXF1OOBwWoODfS2uzqHrY62jZcqvHlil3E
 /eg80B9YAtY3VxbNRn+ZsKkMGoEjZrQCiSRnAJt/rkCxZJTA8nINnYlncUI5wXEB02Ek=;
Received: from aserp2120.oracle.com ([141.146.126.78])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ipOgo-00E3Dv-QC
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 09 Jan 2020 03:41:00 +0000
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 0093Y91f165213;
 Thu, 9 Jan 2020 03:40:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=to : cc : subject :
 from : references : date : in-reply-to : message-id : mime-version :
 content-type; s=corp-2019-08-05;
 bh=d286TUXfSVAxHnl9z2DyeRiz3PyfuYs/FVhffcmdrHI=;
 b=qBjXF9EEZvVjREBQqOD3nS6joNQ8l/CSfkq4zKjHaqIx8/X7IZD04wuMDFHN2trWNTGd
 QoTryWftjxWUVg8DU1R+kRczakqJBoKgetQ8TBOSPBefI3gmE5edCg04UvqdTz5MWYqd
 R76CHK9kDCD4rhD2blijFxJmD3N3AQie1mM5vh/oangx5yw7VmOmJSBIAGOQAutcEjfm
 WjwtitDt+Z8llvkwc6kkAxpxaQ/RmBjnVZHVKO2ax4FbSSUJ3W4cCyyD8Sg4DZxyU9PU
 nQvYEMCtNFtntHLvu06/h/W3hUdX/G6ouabHTNuWZU0DB2P587n4ViSqtyuse2HuzZkZ aA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 2xajnq83nd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 09 Jan 2020 03:40:36 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 0093XAkf107048;
 Thu, 9 Jan 2020 03:40:35 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3030.oracle.com with ESMTP id 2xdmrx90ua-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 09 Jan 2020 03:40:35 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0093eXBk007672;
 Thu, 9 Jan 2020 03:40:33 GMT
Received: from ca-mkp.ca.oracle.com (/10.159.214.123)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 08 Jan 2020 19:40:33 -0800
To: Christoph Hellwig <hch@infradead.org>
From: "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
References: <20191218145136.172774-1-satyat@google.com>
 <20191218145136.172774-3-satyat@google.com>
 <20191218212116.GA7476@magnolia> <yq1y2v9e37b.fsf@oracle.com>
 <20191218222726.GC47399@gmail.com> <yq1fthhdttv.fsf@oracle.com>
 <20200108140730.GC2896@infradead.org>
Date: Wed, 08 Jan 2020 22:40:30 -0500
In-Reply-To: <20200108140730.GC2896@infradead.org> (Christoph Hellwig's
 message of "Wed, 8 Jan 2020 06:07:30 -0800")
Message-ID: <yq1ftgpxpox.fsf@oracle.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1.92 (gnu/linux)
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9494
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=598
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2001090033
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9494
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=659 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-2001090033
X-Spam-Score: -0.4 (/)
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
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1ipOgo-00E3Dv-QC
Subject: Re: [f2fs-dev] [PATCH v6 2/9] block: Add encryption context to
 struct bio
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
Cc: linux-block@vger.kernel.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org,
 "Darrick J. Wong" <darrick.wong@oracle.com>,
 Kuohong Wang <kuohong.wang@mediatek.com>, Kim Boojin <boojin.kim@samsung.com>,
 Barani Muthukumaran <bmuthuku@qti.qualcomm.com>,
 Satya Tangirala <satyat@google.com>, Eric Biggers <ebiggers@kernel.org>,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net


Christoph,

>> Absolutely. That's why it's a union. Putting your stuff there is a
>> prerequisite as far as I'm concerned. No need to grow the bio when the
>> two features are unlikely to coexist. We can revisit that later should
>> the need arise.
>
> With NVMe key per I/O support some form of inline encryption and PI are
> very likely to be used together in the not too far future.

I don't disagree that we'll have to manage coexistence eventually. Hence
my comments about being able to chain multiple things to a bio.

In the immediate term, though, I think it makes sense to leverage the
integrity pointer to avoid growing struct bio.

-- 
Martin K. Petersen	Oracle Linux Engineering


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
