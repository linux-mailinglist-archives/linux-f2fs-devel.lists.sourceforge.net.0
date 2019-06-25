Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 23CE2556BB
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Jun 2019 20:05:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hfpoI-0001Uj-0I; Tue, 25 Jun 2019 18:04:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <darrick.wong@oracle.com>) id 1hfpoG-0001Ua-H6
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 25 Jun 2019 18:04:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=q3PQ3FdT4Cu9ZFxkmPMEB5w+ChSGz6mW1jtUBkoDAvw=; b=mHO0nwETcdaMgZH6WPnwPOMwF4
 1QKlcImjjjsXSghH+lSVcuengny/v2WWyyBmAP7szkK9iRcGmhmJPbEwcB2vVCLoLE2K/aidE04nI
 GUH5T3x+3y0iBZmWnodSVbriIdVyIELxRS0DODMTX25+dQkAX8BJpCP0ExgpKt2BiEqg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=q3PQ3FdT4Cu9ZFxkmPMEB5w+ChSGz6mW1jtUBkoDAvw=; b=RTQbLTJ9YwuZAlwQHMTn0qoTVE
 OUfO2YrsT0YTGPfmUYDwneHJaB1HIS4VL58zVki6YDgaUREMDrPMJ7HgDMYc2Vm5qvtHC6Qlfrscw
 4LLZJFymrthd2+n/VvfePceknblRLQ2u48OsDwJ0lxo1seqY7yEcIQ/pANOtuFTa4zYA=;
Received: from userp2130.oracle.com ([156.151.31.86])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hfpoH-00DRRY-JA
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 25 Jun 2019 18:04:52 +0000
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5PHwd8B149230;
 Tue, 25 Jun 2019 18:03:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2018-07-02;
 bh=q3PQ3FdT4Cu9ZFxkmPMEB5w+ChSGz6mW1jtUBkoDAvw=;
 b=ksyT2XyNq/sBFuNf0kcEOahW5dSfpRm2xoyvLHIl5Mejyeb4JLMflOsVy5quxvpN67j2
 IsKXQAf1HGSoM5FioAjK6ozKyUInygd/ml7l4zpRXtxh/UWz20oKY/FTMlcYaDZBA7N9
 MY/zMgGVdosxoetsazUmPfKqNstqSPWvasVhjypJJqeFcHhDaP62mxpCpMaNSfCtaBX3
 JdFoGt472fc1h8ZFinUmpgHsBMZcZBqagXk/T9NnnQ5VQ3pfbtpwxQaYR4yLbxZKG58n
 MOx1qf1doyupoPytNdwt2e/QYdozJOX4KCvtmdKWmiW/VFWoTbAzfyslOGA2S3jKu5TS Qg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 2t9brt61nv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Jun 2019 18:03:42 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5PI2jR6140649;
 Tue, 25 Jun 2019 18:03:41 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3020.oracle.com with ESMTP id 2t9p6ub7ds-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 25 Jun 2019 18:03:41 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x5PI3fsX143158;
 Tue, 25 Jun 2019 18:03:41 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3020.oracle.com with ESMTP id 2t9p6ub7dj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Jun 2019 18:03:41 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x5PI3VCg025882;
 Tue, 25 Jun 2019 18:03:31 GMT
Received: from localhost (/67.169.218.210)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 25 Jun 2019 11:03:31 -0700
Date: Tue, 25 Jun 2019 11:03:26 -0700
From: "Darrick J. Wong" <darrick.wong@oracle.com>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <20190625180326.GC2230847@magnolia>
References: <156116141046.1664939.11424021489724835645.stgit@magnolia>
 <20190625103631.GB30156@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190625103631.GB30156@infradead.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9299
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=904 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906250136
X-Spam-Score: -0.1 (/)
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
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hfpoH-00DRRY-JA
Subject: Re: [f2fs-dev] [PATCH v4 0/7] vfs: make immutable files actually
 immutable
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
Cc: linux-efi@vger.kernel.org, linux-btrfs@vger.kernel.org, linux-mm@kvack.org,
 clm@fb.com, adilger.kernel@dilger.ca, matthew.garrett@nebula.com,
 linux-nilfs@vger.kernel.org, linux-ext4@vger.kernel.org,
 devel@lists.orangefs.org, josef@toxicpanda.com, reiserfs-devel@vger.kernel.org,
 viro@zeniv.linux.org.uk, dsterba@suse.com, jaegeuk@kernel.org, tytso@mit.edu,
 ard.biesheuvel@linaro.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 jk@ozlabs.org, jack@suse.com, linux-fsdevel@vger.kernel.org,
 linux-mtd@lists.infradead.org, ocfs2-devel@oss.oracle.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Jun 25, 2019 at 03:36:31AM -0700, Christoph Hellwig wrote:
> On Fri, Jun 21, 2019 at 04:56:50PM -0700, Darrick J. Wong wrote:
> > Hi all,
> > 
> > The chattr(1) manpage has this to say about the immutable bit that
> > system administrators can set on files:
> > 
> > "A file with the 'i' attribute cannot be modified: it cannot be deleted
> > or renamed, no link can be created to this file, most of the file's
> > metadata can not be modified, and the file can not be opened in write
> > mode."
> > 
> > Given the clause about how the file 'cannot be modified', it is
> > surprising that programs holding writable file descriptors can continue
> > to write to and truncate files after the immutable flag has been set,
> > but they cannot call other things such as utimes, fallocate, unlink,
> > link, setxattr, or reflink.
> 
> I still think living code beats documentation.  And as far as I can
> tell the immutable bit never behaved as documented or implemented
> in this series on Linux, and it originated on Linux.

The behavior has never been consistent -- since the beginning you can
keep write()ing to a fd after the file becomes immutable, but you can't
ftruncate() it.  I would really like to make the behavior consistent.
Since the authors of nearly every new system call and ioctl since the
late 1990s have interpreted S_IMMUTABLE to mean "immutable takes effect
everywhere immediately" I resolved the inconsistency in favor of that
interpretation.

I asked Ted what he thought that that userspace having the ability to
continue writing to an immutable file, and he thought it was an
implementation bug that had been there for 25 years.  Even he thought
that immutable should take effect immediately everywhere.

> If you want  hard cut off style immutable flag it should really be a
> new API, but I don't really see the point.  It isn't like the usual
> workload is to set the flag on a file actively in use.

FWIW Ted also thought that since it's rare for admins to set +i on a
file actively in use we could just change it without forcing everyone
onto a new api.

--D


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
