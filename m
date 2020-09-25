Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 01754278577
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 25 Sep 2020 12:59:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kLlRI-0004vg-9e; Fri, 25 Sep 2020 10:58:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dan.carpenter@oracle.com>) id 1kLlRG-0004vY-MA
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 25 Sep 2020 10:58:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YWYBLQJom0rbcKpapTweEAGh/5w1aYSujhgyoKpy7JY=; b=A4vT+79iRvsr6uxViRKB9V0oY5
 YTUattQ5+WP/dcywvtliDdyBaHbQvFNJwCbAZWvVEGMueaKNv+js8vRKxY4CyXcWTSV2JiMQ6+8IW
 XXxgIsWKCSY6JYJ8VC/mgm/4GFJ8X6XBC9jBGP40l4qNoMhikbs34RXV705fdji5JuY0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YWYBLQJom0rbcKpapTweEAGh/5w1aYSujhgyoKpy7JY=; b=ZrSyPIwwzBQEKEE6PvGMgaSFVg
 yOqfUmg0wPAKMp9DmWPZX3zoIABSr0Xzc+dFDbX6sn+ENP33a9XkyoHboKUfLDpPTBMcD+vWTHOku
 Ohz+W9+RL9C0h1Qxsmyn4b+Q6hyYJNsL2RKXxFVq43sVIIL1xoueYB6wR+n9IVbe/HSw=;
Received: from userp2120.oracle.com ([156.151.31.85])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kLlR0-007ezz-U3
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 25 Sep 2020 10:58:54 +0000
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08PAnLpU148584;
 Fri, 25 Sep 2020 10:58:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=YWYBLQJom0rbcKpapTweEAGh/5w1aYSujhgyoKpy7JY=;
 b=hSFwguCm4/ZHGdmos+q9zlfdpKdMq03tzIHWIS5qMOJtsDuh/HflJzLJizIalvFN8KNE
 eMpjds5UsCUVMUiN5mVHwAHh6wsGcBhdL3E3TA/sL05DQddTPMgA9PxFBXPMAd/Zf8Kg
 yYWJ7wOHtR60hVDqiv1MBW015fmXfXggrLdkWe/a2MT1YxGeR2pVB5ih9aYHr7j37Bqt
 IIBw4Sbx6eI6O/7G92XF4VK5jVsee96QA/EwSb9cWOJTgbpnHzj2DQ18uj6iETCY5zyZ
 o53gVOQsOptLsfeP8IhHia4JyQIcaLMv4J3Ieqxs3nIR2u2Hqdtjq60x4uQAAy/pC8EM +Q== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 33ndnuw036-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 25 Sep 2020 10:58:08 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08PAoDtv142757;
 Fri, 25 Sep 2020 10:58:08 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 33r28y8s2v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Sep 2020 10:58:08 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 08PAw6CV018744;
 Fri, 25 Sep 2020 10:58:06 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 25 Sep 2020 03:58:05 -0700
Date: Fri, 25 Sep 2020 13:57:58 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20200925105758.GN4282@kadam>
References: <000000000000f9f80905b01c7185@google.com>
 <eb03a5c9-eb77-eb91-e17f-8a3273aab7da@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <eb03a5c9-eb77-eb91-e17f-8a3273aab7da@huawei.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9754
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 mlxlogscore=999
 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009250075
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9754
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1011 impostorscore=0 mlxlogscore=999 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009250075
X-Spam-Score: -1.3 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [156.151.31.85 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
 -1.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kLlR0-007ezz-U3
Subject: Re: [f2fs-dev] KMSAN: uninit-value in f2fs_lookup
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
Cc: syzbot <syzbot+0eac6f0bbd558fd866d7@syzkaller.appspotmail.com>,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, glider@google.com, jaegeuk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Sep 25, 2020 at 05:06:33PM +0800, Chao Yu wrote:
> Hi,
> 
> I don't see any problem here, thanks for your report. :)
>

I bet the uninitialize value is because "max_depth" is zero.


   352  struct f2fs_dir_entry *__f2fs_find_entry(struct inode *dir,
   353                                           const struct f2fs_filename *fname,
   354                                           struct page **res_page)
                                                               ^^^^^^^^
The stack trace says this isn't initialized.

   355  {
   356          unsigned long npages = dir_blocks(dir);
   357          struct f2fs_dir_entry *de = NULL;
   358          unsigned int max_depth;
   359          unsigned int level;
   360  
   361          if (f2fs_has_inline_dentry(dir)) {
   362                  *res_page = NULL;
   363                  de = f2fs_find_in_inline_dir(dir, fname, res_page);
   364                  goto out;
   365          }
   366  
   367          if (npages == 0) {
   368                  *res_page = NULL;
   369                  goto out;
   370          }
   371  
   372          max_depth = F2FS_I(dir)->i_current_depth;
   373          if (unlikely(max_depth > MAX_DIR_HASH_DEPTH)) {
   374                  f2fs_warn(F2FS_I_SB(dir), "Corrupted max_depth of %lu: %u",
   375                            dir->i_ino, max_depth);
   376                  max_depth = MAX_DIR_HASH_DEPTH;
   377                  f2fs_i_depth_write(dir, max_depth);
   378          }
   379  
   380          for (level = 0; level < max_depth; level++) {
                                ^^^^^^^^^^^^^^^^^
If "max_depth" is zero, then we never enter this loop.

   381                  *res_page = NULL;
   382                  de = find_in_level(dir, level, fname, res_page);
   383                  if (de || IS_ERR(*res_page))
   384                          break;
   385          }
   386  out:
   387          /* This is to increase the speed of f2fs_create */
   388          if (!de)
   389                  F2FS_I(dir)->task = current;
   390          return de;

Which means that we return a NULL "de" and "*res_page" is uninitialized
and that matches what syzbot found throug runtime testing.

   391  }

regards,
dan carpenter


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
