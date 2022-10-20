Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E6D605B18
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 20 Oct 2022 11:28:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1olRqS-0004lw-BM;
	Thu, 20 Oct 2022 09:28:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <quic_mojha@quicinc.com>) id 1olRqH-0004lc-BC
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 20 Oct 2022 09:27:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:CC:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6sPN/oZ0j7YOXdqz16h7W9EvY3CvqWvMNsBxtOthMVk=; b=kNoasmsq4Ywl4FVc0niz5Ow+vf
 RMrzLmqnmUOV0RDFHMr7v1KiNGbcq3cN2m6p9npmVwqCI19IOdAPYG3pdee1HsTt1eCxf+ky8hDZ7
 lAmhowb2dhATmm9R+JPCn7J9w1QR3YL24pB+NmgGbeKJsWC0415IvsrmkIOm0/4f/47M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6sPN/oZ0j7YOXdqz16h7W9EvY3CvqWvMNsBxtOthMVk=; b=GdQ9zBUv75/FTzzwXrG76zR+wv
 HDyGN/jcOu4UfWOTc7IY5f0vqqeyxtIbyAGuIFWzeCKmfmym6/fIzBDBaIJ/V/zSeab75xwRgCGDL
 DBYiBS6dFWK9oRRrGHN4jdGr/tzmYUDis/FBSCv6R60nHJXUhW0UxzHuZwqI+GgoFL78=;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1olRqC-0001SD-A7 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 20 Oct 2022 09:27:57 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29K9AEm9016083;
 Thu, 20 Oct 2022 09:27:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=6sPN/oZ0j7YOXdqz16h7W9EvY3CvqWvMNsBxtOthMVk=;
 b=eXMrG2i64m8sY1NakFYlKi+rtrm9zCgPEihZhNEPexQChMr0U1+AiQBeYxZFLxWijQUT
 sXZRccml4hphoyyE2GjnwRkSzYr6V2QgHllCIpw0vvh4IpnK2BghdTfG+4JFXHGTB6CN
 HMSe1J0WYo5Yg90ITJXo79mLTrJvbn03sQtfRZXjWGK3+5XnVdUUA53o7LZ14HTWt5kh
 MeWTM5KZK/kfEIzL7yn+xeXFWY5jSfZQSFsZXxkMeNr4IB/TXARL6dDU0GdTMlz/BOFh
 Per1YvdfSp4P626fRA+5/lWPUIbl+9omR6bfT/Fe+Xb3LG+hy93AmNWDJE5LtvJsc08m ew== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kavfm0ws0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Oct 2022 09:27:44 +0000
Received: from nasanex01c.na.qualcomm.com (corens_vlan604_snip.qualcomm.com
 [10.53.140.1])
 by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 29K9RiDJ023080
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Oct 2022 09:27:44 GMT
Received: from [10.214.66.81] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Thu, 20 Oct
 2022 02:27:42 -0700
Message-ID: <8cb1ce88-2e49-745a-dd40-29a084ce285b@quicinc.com>
Date: Thu, 20 Oct 2022 14:57:39 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Content-Language: en-US
To: Chao Yu <chao@kernel.org>, <jaegeuk@kernel.org>, <mhiramat@kernel.org>
References: <1666196277-27014-1-git-send-email-quic_mojha@quicinc.com>
 <35c29f27-96c6-6d74-1efb-1588cbf430a2@kernel.org>
From: Mukesh Ojha <quic_mojha@quicinc.com>
In-Reply-To: <35c29f27-96c6-6d74-1efb-1588cbf430a2@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: u4UO4k7MHNtSUY5Uymy_mq5zp7NpH1TL
X-Proofpoint-ORIG-GUID: u4UO4k7MHNtSUY5Uymy_mq5zp7NpH1TL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-20_03,2022-10-19_04,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 mlxlogscore=724
 impostorscore=0 bulkscore=0 clxscore=1015 mlxscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210200055
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, On 10/20/2022 2:31 PM, Chao Yu wrote: > On 2022/10/20
 0:17,
 Mukesh Ojha wrote: >> commit 18ae8d12991b ("f2fs: show more DIO information
 in tracepoint") >> introduces iocb field in 'f2fs_direct_IO_ente [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: quicinc.com]
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [205.220.168.131 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1olRqC-0001SD-A7
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix the assign logic of iocb
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

Hi,

On 10/20/2022 2:31 PM, Chao Yu wrote:
> On 2022/10/20 0:17, Mukesh Ojha wrote:
>> commit 18ae8d12991b ("f2fs: show more DIO information in tracepoint")
>> introduces iocb field in 'f2fs_direct_IO_enter' trace event
>> And it only assigns the pointer and later it accesses its field
>> in trace print log.
>>
>> Fix it by correcting data type and memcpy the content of iocb.
> 
> So the implementation below is wrong, right? since it just assign 
> __entry->name
> with dentry->d_name.name rather than copyiny entirely, so that, during 
> printing

I think, yes.

About the patch, we were getting error as below on doing

echo 51200 > /d/tracing/buffer_size_kb
echo 1 > /d/tracing/events/f2fs/f2fs_direct_IO_enter/enable
echo 1 > /d/tracing/tracing_on
cat /d/tracing/trace_pipe > ftrace.log

Run something which exercise this path.

Unable to handle kernel paging request at virtual address ffffffc04cef3d30
Mem abort info:
ESR = 0x96000007
EC = 0x25: DABT (current EL), IL = 32 bits

  pc : trace_raw_output_f2fs_direct_IO_enter+0x54/0xa4
  lr : trace_raw_output_f2fs_direct_IO_enter+0x2c/0xa4
  sp : ffffffc0443cbbd0
  x29: ffffffc0443cbbf0 x28: ffffff8935b120d0 x27: ffffff8935b12108
  x26: ffffff8935b120f0 x25: ffffff8935b12100 x24: ffffff8935b110c0
  x23: ffffff8935b10000 x22: ffffff88859a936c x21: ffffff88859a936c
  x20: ffffff8935b110c0 x19: ffffff8935b10000 x18: ffffffc03b195060
  x17: ffffff8935b11e76 x16: 00000000000000cc x15: ffffffef855c4f2c
  x14: 0000000000000001 x13: 000000000000004e x12: ffff0000ffffff00
  x11: ffffffef86c350d0 x10: 00000000000010c0 x9 : 000000000fe0002c
  x8 : ffffffc04cef3d28 x7 : 7f7f7f7f7f7f7f7f x6 : 0000000002000000
  x5 : ffffff8935b11e9a x4 : 0000000000006250 x3 : ffff0a00ffffff04
  x2 : 0000000000000002 x1 : ffffffef86a0a31f x0 : ffffff8935b10000
  Call trace:
   trace_raw_output_f2fs_direct_IO_enter+0x54/0xa4
   print_trace_fmt+0x9c/0x138
   print_trace_line+0x154/0x254
   tracing_read_pipe+0x21c/0x380
   vfs_read+0x108/0x3ac
   ksys_read+0x7c/0xec
   __arm64_sys_read+0x20/0x30
   invoke_syscall+0x60/0x150
   el0_svc_common.llvm.1237943816091755067+0xb8/0xf8
   do_el0_svc+0x28/0xa0

-Mukesh


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
