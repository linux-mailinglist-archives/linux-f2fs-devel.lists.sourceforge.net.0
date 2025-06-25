Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 787FCAE8B7A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 25 Jun 2025 19:26:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HhWjRCZ6miEheKkhe/gk+N5VoN8GsxZLmNrKMRfZNjk=; b=HmImhsuyxROWc74VSO+7cajuXz
	h6SJ78SswIBFZh/GTYztT8tdPmDnq9aMM5TS5q8Xm+NdkNyb0f+GaKNrMCj9BzCA5ovm8XXGuwpb7
	t5Zr+dyKktgG3knf6EFFoYtPMAmnsibHsQ5Z8MN9OkRXpYgsnG+nZ/592yuBTUl+vt74=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uUTsj-0003QU-99;
	Wed, 25 Jun 2025 17:25:57 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <prvs=82719b5360=maxime.mere@foss.st.com>)
 id 1uUTsi-0003QC-0p for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 25 Jun 2025 17:25:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:CC:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sYD/Lymlz7Mf2jc6nosjwnFLo2PusAF37AUx9QeP1Cg=; b=k41CiT9Da+W8wESH8l77QixVRg
 8KuGbTEVe7b0F4W4R1JHx7sUrgLpOo3/3GWKssg/ONpDyMVH8rP6lgWlV7wHQyoN3jzBZAbCIPS+Z
 hQTcXfM/ecvOGZjvzkdOGb0b8+0HlUPIYhEiC0DtM41i9zGWFXnQz5AMxkYd14N5j08c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sYD/Lymlz7Mf2jc6nosjwnFLo2PusAF37AUx9QeP1Cg=; b=hhCHIhM5yYyiwrHXze+mcWu4GW
 1NVEwl3XQA0++0QRHG/5RLSJUUUxVG2f7xN0dmEQfbCDIOtItMmlajimPsatfCss/h4ukc5lh7Qet
 Go/+KNe/EcaPsP5PFazX0kth/MwcYELfEckS50Sp0iBvYJWgsr8e/cSdytn3n65SLQx0=;
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uUTsh-0008Qr-B3 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 25 Jun 2025 17:25:55 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PFw81R012645;
 Wed, 25 Jun 2025 18:31:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 sYD/Lymlz7Mf2jc6nosjwnFLo2PusAF37AUx9QeP1Cg=; b=rh6geYpCt/a5QcHE
 Zg4iGmEtUbuC2rwrdezwKyU+87+2fCJpBJDjqzZaXVlyPLuewIdOevNI1GSeyKAr
 CnGMnOzWLlc4TRaP/DhGtvQtQw7MlttlbJXiQuPoYzKBTZCVSER5q5MgPI2ACYP4
 mpZeDT5HIVzcKN6rmJdbSx6SSgA7iPLyCLN+FJICA33t5Ttro0qPp+VEkQXvqY64
 194e7gv4CQbI04t0D+8/1tb1ANkTEPhXPywiBoFZfcJrD5XF7l4Lhm/sfEpESg/u
 y/4AnYW12AZEw6VfOMtqFugF8TV+asMQwKs36PQjceVjlRvuZjieC5VBpU/7y/Kh
 AGZtOA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47e6a6rsdy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Jun 2025 18:31:00 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 825BC40044;
 Wed, 25 Jun 2025 18:30:05 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 55CA8BF539D;
 Wed, 25 Jun 2025 18:29:27 +0200 (CEST)
Received: from [10.48.86.103] (10.48.86.103) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 25 Jun
 2025 18:29:26 +0200
Message-ID: <f174540e-4b9a-4dc1-9ab8-f4f36fe1f837@foss.st.com>
Date: Wed, 25 Jun 2025 18:29:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Eric Biggers <ebiggers@kernel.org>, Simon Richter
 <Simon.Richter@hogyros.de>
References: <20250611205859.80819-1-ebiggers@kernel.org>
 <7f63be76-289b-4a99-b802-afd72e0512b8@hogyros.de>
 <20250612005914.GA546455@google.com> <20250612062521.GA1838@sol>
 <20250625063252.GD8962@sol>
Content-Language: en-US
From: Maxime MERE <maxime.mere@foss.st.com>
In-Reply-To: <20250625063252.GD8962@sol>
X-Originating-IP: [10.48.86.103]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_05,2025-06-25_01,2025-03-28_01
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, On 6/25/25 08:32,
 Eric Biggers wrote: > That was the synchronous
 throughput. However, submitting multiple requests > asynchronously (which
 again, fscrypt doesn't actually do) barely helps. > Apparentl [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1uUTsh-0008Qr-B3
Subject: Re: [f2fs-dev] [PATCH] fscrypt: don't use hardware offload Crypto
 API drivers
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-crypto@vger.kernel.org, ceph-devel@vger.kernel.org,
 linux-ext4@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi,

On 6/25/25 08:32, Eric Biggers wrote:
> That was the synchronous throughput.  However, submitting multiple requests
> asynchronously (which again, fscrypt doesn't actually do) barely helps.
> Apparently the STM32 crypto engine has only one hardware queue.
> 
> I already strongly suspected that these non-inline crypto engines aren't worth
> using.  But I didn't realize they are quite this bad.  Even with AES on a
> Cortex-A7 CPU that lacks AES instructions, the CPU is much faster!

 From a performance perspective, using hardware crypto offloads the CPU, 
which is important in real-world applications where the CPU must handle 
multiple tasks. Our processors are often single-core and not the highest 
performing, so hardware acceleration is valuable.

I can show you performance test realized with openSSL (3.2.4) who shows, 
less CPU usage and better performance for large block of data when our 
driver is used (via afalg):

command used: ```openssl speed -evp aes-256-cbc -engine afalg -elapsed```

+--------------------+--------------+-----------------+
| Block Size (bytes) | AFALG (MB/s) | SW BASED (MB/s) |
+--------------------+--------------+-----------------+
| 16                 | 0.09         | 9.44            |
| 64                 | 0.34         | 11.43           |
| 256                | 1.31         | 12.08           |
| 1024               | 4.96         | 12.27           |
| 8192               | 18.18        | 12.33           |
| 16384              | 22.48        | 12.33           |
+--------------------+--------------+-----------------+

to test CPU usage I've used a monocore stm32mp157f.
here with afalg, we have an average CPU usage of ~75%, with the sw based
approach CPU is used at ~100%

Maxime


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
