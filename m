Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E8A466DA5A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 Jan 2023 10:54:59 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pHig7-0005NY-TH;
	Tue, 17 Jan 2023 09:54:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pHifo-0005NI-H5
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 17 Jan 2023 09:54:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uTrEb2Cwr9F7vWkD0UMRfe1+egrfVdeiqDQjljagu4g=; b=lhxt7Y1r0pSbItAAOkz3gpBNb4
 3bgJbe/5nPGB9ZCF/s7PmmzJ4//Kkn7MEsaAuSOreXHPeqYIpXjqDXYVACdQgN31lH/8tdLJYhx0B
 wWlaz/jQr6lNG2iHEjcmw4QeNJF+GaHaCmsjPEgFuiB+gjkCT4ecp2L6HxP4BMNh7OdQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=uTrEb2Cwr9F7vWkD0UMRfe1+egrfVdeiqDQjljagu4g=; b=b
 k83lYNyJbbmB/R4IR9thUJzaqafxWibCSK5CwbrtAcaEyUCgJHlit0gnpPWaEgiSKDBnuwL/V9hbx
 ErROpj09qAjfG5nWbYYiigEo+LlQJz49Xqf2uW2Yg+oZGoCz22TFfKZ2uwbrVRHTDtVTp68bPVdjU
 KD/zn1a5POe4Cb5s=;
Received: from mail-psaapc01on2138.outbound.protection.outlook.com
 ([40.107.255.138] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pHifk-0005kQ-1w for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 17 Jan 2023 09:54:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NSDO3woNzIc4ONXQrmHiqGB8Ll8z/Q+d7SMXmK6VCNb569Zy4qA9j2e4gih7nET3xqvOagUfPcGSzFVMFO+7vTqd0RfS3zfISKv+rEP17HORGvmsVuFOjiGBdDid41xe7waowx+lq4iC4kTqHgEA/Xg6pE4QJo1yGbuOpfLrIier7rFQeE+eqzTMluefL1Zufn0gJ25FR4lIlKP+2Ne0/yuOBgKUpdOmUZQQrMMPUAKd7oIMQOmLNheZGnlZRaqi1h0hJeJym0Gu7+C2+Q4oJ2xkDe/TcvRgOI0UFZvywCaSqt6xJr1UPVujtHip6Y4fjUvQWwgvC2uWj22ZqvsLJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uTrEb2Cwr9F7vWkD0UMRfe1+egrfVdeiqDQjljagu4g=;
 b=D+jt3oZjG4zBnM4pN3tVBcOePpYDjjieKCys40OWPfUO2KnYW2A1igCAlBdgsb/32eMWoSHhrW/ocqBrFFxA7LtzepoBdpSLRGSlmqBJ/zHyy5B9Xauwli1AjdpijD6M3PrIkJvyvBIV+VtUBRA7DMSwgl8kT58MEY+5ADqznv0UMkc7CCJZa0nz5V5e3+ca8ONiTX3jtedOsSJOFqJwE3drUEw3tV8ShJlu7f0WwdbglcZeJ+P5hK45jGjtp+qATS+6XHC9RS+Qsjj0UOTNHdERrQmo/XaexyYCnbhyV9bQOpoCDgtxBd/rHhKbuNWeyKBuM5NXJ9lO2zP/9jcL3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uTrEb2Cwr9F7vWkD0UMRfe1+egrfVdeiqDQjljagu4g=;
 b=m2kdxy41oHRWZbJlIC+vdGKZU5Urmx2KcAqW9/tznPsZO1BWDBS9xGLtV/MSTIu9A+qwPMgu9x50wxf8SR9xWTB8sLsGIBpic/L1aW984NdropJpHmPx2pVAlCoFLiwvT47cf54aCo+LMyJS2nXaDwgZXKE8ieqKbVVeyi84faQWaGCD5vDdAVlqh5Bi7+hor6+H+ti5Jlw88NoCKta4AbM/a6hCemQCwcmavlb1lPUKXGr5UhmC6h5OpFy7GnheWHbVN/kDsE+2tnZ1tU7ruXK+2odUCSakRaBay7LK72cqseZ5lEteOl0RdQl0yvZuiKKfzDKUw8zqB4yKFTA10A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SG2PR06MB5287.apcprd06.prod.outlook.com (2603:1096:4:1df::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Tue, 17 Jan
 2023 09:54:16 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::3e52:d08c:ecf4:d572]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::3e52:d08c:ecf4:d572%5]) with mapi id 15.20.6002.012; Tue, 17 Jan 2023
 09:54:16 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 17 Jan 2023 17:54:07 +0800
Message-Id: <20230117095407.37398-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SG2P153CA0048.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::17)
 To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SG2PR06MB5287:EE_
X-MS-Office365-Filtering-Correlation-Id: 2074cf09-3ebe-4aa0-220a-08daf870cb8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AUR77EBxYT7lAQEock5u7mXhtV5HU40MwQ4BMJtPB605A/crbLDGV990GdbFhr5eadUpCckOLbCyhzyESGBapPuwewiILOqFNSAANtguX7telX/sfSYlwV5JxlWq5q8pIwNVXiblqEA3PyGBFa4Mw/tJQttBcH2XdV3/3qREHFwgEEaiaegnJutbQRwo1j+qnKkq8/2ltD55cAelyqV3IoTE9ceWexZsPJckDSpbEUUBBX+kZJ/0fAKVjXZ4yLZZG8WhEKiZ78ZV/v+8a4KCf/WxsIh8TB4xaJeXt92/o6PSj4/J4xlNn0LJxmt82291QiBY/UkF27cclnVPB9IfFeXxlGBCDyrl0Mgjg4ll0Y96Ajg+jfr4FHt/150OoTsWxgjZTImT0Ta6gJZnGmsGhKQZ/BeMYvOqEH7ffTIO3SOefDgsKe4iYQkSR18FNYWb/AfTb6ODO8Afphx4hrLOSle9qp4ed0d/S8XEfjJGdk0pXYHtRLvEOqEyWPtSLBZILc9dMUcyjxeJQOWZu814cH+nFPkW17efUr7zeu0cWvSdSfRGLmRqO/QnPtfv+fgVNUGK1wb0AiDXzOmL+lgW/3i5YDp3ldg70+GOEbnuoCGUMMNomUlq/Ky4sBdBjyTfHlWOPUk7DuiqRAq/lCYz4GwjsVPoGsMeaXVf8wvAON4OofLQolJVrGDdEQktQhM8
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(39860400002)(396003)(376002)(136003)(346002)(451199015)(6486002)(4744005)(8936002)(478600001)(5660300002)(4326008)(41300700001)(26005)(66476007)(66556008)(8676002)(66946007)(36756003)(2906002)(186003)(316002)(86362001)(52116002)(38100700002)(38350700002)(6506007)(6666004)(107886003)(1076003)(6512007)(2616005)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?G9ENNNWLYhn7G4VT9/y1VAfi53ijOLblbs335QSelqPIC1o2JGR3/GO5W69C?=
 =?us-ascii?Q?GtxMgdlsaRqpXGBtY42rK76dyqH/RsRG8868tJfbLkGzOOyIPnUl4fIT1kzk?=
 =?us-ascii?Q?lP6KGEST2Im+4pVSrFK1qoR9fFHR3aFG07GP9vrbe2Mq+07101V8NU6Xg+tR?=
 =?us-ascii?Q?hkV6N9tCKMo8UImGyRbKEypqGcFFsTMug8clKYhFfYxAJr74eTpwbzLCWMPj?=
 =?us-ascii?Q?UR3WFslJZv6PSS5m9YgmJRnTUoOOCsTZiNsqnbEy57Io0j+VFEs3etgJOa2c?=
 =?us-ascii?Q?tp9fiUVKANdtO/6ZRc5VIZY++sb+YJix7by6G+tx2/qmX//kQbSeJH/34KCg?=
 =?us-ascii?Q?BnnK/d1cfrcsCd3R7BeRggEFHSudsCXjsNbCtUBBgqDQfwVTpqFeq0612a0v?=
 =?us-ascii?Q?Mipl95Hlf6mWOTw877SNESMAdmbbUDiIpU2n1Ycp5d/7TjB91Q+v9y98IDxR?=
 =?us-ascii?Q?eHUNBQxqvDjJ4n4nNcBrv0IsfFpXVLePh98whhNRVrROc2QR6TDOLZEOi16d?=
 =?us-ascii?Q?FuOmgiwr4rvQO7FV7M6BmdQICVg6jbFqMzVmc1ZSeWe2P+5RCFCFFvS+tHBM?=
 =?us-ascii?Q?MeLUIemPM71QxOgkRb8Az6a4cUqr5l/fpAludTw5NixRX6sp30fc02L6GXQ0?=
 =?us-ascii?Q?QLQoWsdoBbFk/Dwi46//M9bRtWQ/z9Ku7EBaPO+TASm5OGvZFq877vP08xUs?=
 =?us-ascii?Q?hYPuC09R9gc+rzPnso4pZYgti8UItxrS2KCa8rhoIskRIeMc/jouObDzLYaM?=
 =?us-ascii?Q?8tlvK2ubpb+s8sp5PaOSyuaRcoMrYvGGVtBfW+gzLkh/H39Ypv75x64IAcSP?=
 =?us-ascii?Q?BF5C6AUy6ZVMR02hRVy4NBgTLBibIz/U6SeS/2PfGspK4OBzo7J26MMHagT+?=
 =?us-ascii?Q?+Xj8oELJl/EIMtkg37xW+9iGmac6uptbCdwP3wRBWrx5mQACf/dmTsmmgXQQ?=
 =?us-ascii?Q?0Tcaaa8A8OGUjY3VsO2MfgP++HqVmkavXi927zF0bMROuV9kVf4hyDOMWVcl?=
 =?us-ascii?Q?dj1e94EHELGwCKMGCANfVShathF46TFlTdsMvU2xmfGLFyQudB5n1w2H/I7r?=
 =?us-ascii?Q?PqZvHrWKpUwe4CVJ5rYt2LEDgzs1LkxfWkQ998DB0/GIUFcDabN9LXTk/QFN?=
 =?us-ascii?Q?RWJvgD6sO2qfykABg19EDK0PlEIyFrZxzjzzsgg6iCv135h0Rf/+uKX7epev?=
 =?us-ascii?Q?Dbr/a56FqAJaE9AWQ4muwnVVtXBKGYOv7MO7GZUmZblTK0jAyCBUYxcAbGfl?=
 =?us-ascii?Q?KQLFBAc4QW8OaFgk7MYzOe+hU5PdoSzxN3u+2P+5sALrlSdFWhHDxy74cE6O?=
 =?us-ascii?Q?KF5C8C/9VP8I5RleBy32w3CjOkYlPC/fi9+GzfqRvowZBnkZ425eIV9mKHDr?=
 =?us-ascii?Q?2x5FTLZHABMqwlAiQa7v3nH/f19IQxHNDgm35MAO67PrScasWTN5VLzK/JYt?=
 =?us-ascii?Q?+qGHO4EG5GlNKbU0L8sCitkzcYHjE/r/8MByFCQOu1bGtuRg7n+u75ubFbXT?=
 =?us-ascii?Q?SLtYxHfMbN/Td5EdKJYkwfI1RstquBOtkiwgnnNvOWceuKiiLuFh3BJ4LImv?=
 =?us-ascii?Q?yWjVuoDNKc5RTifFluZb+0tDUtWQgffVEMZ053y3?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2074cf09-3ebe-4aa0-220a-08daf870cb8b
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2023 09:54:16.3921 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u0CH34Tp0rqvv8FSkTz5OIO6fC1nBTO0SvZAvUsAvuhgL7xdhP4j75IIFk6N+wbpqOnXAXRFgzJ6G+5R+5pgCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB5287
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  hot_data_age_threshold is a non-zero positive number, and
 condition 2 includes condition 1, so there is no need to additionally judge
 whether t is 0. And we need to judge whether hot_data_age_threshol [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.138 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.138 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1pHifk-0005kQ-1w
Subject: [f2fs-dev] [PATCH] f2fs: fix to check warm_data_age_threshold
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
From: Yangtao Li via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Yangtao Li <frank.li@vivo.com>
Cc: Yangtao Li <frank.li@vivo.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

hot_data_age_threshold is a non-zero positive number, and
condition 2 includes condition 1, so there is no need to
additionally judge whether t is 0. And we need to judge
whether hot_data_age_threshold exceeds the number of available
blocks.

Fixes: 71644dff4811 ("f2fs: add block_age-based extent cache")
Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/sysfs.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index e396851a6dd1..b59595daf3ef 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -689,7 +689,10 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 	}
 
 	if (!strcmp(a->attr.name, "warm_data_age_threshold")) {
-		if (t == 0 || t <= sbi->hot_data_age_threshold)
+		block_t avail_user_block_count;
+
+		avail_user_block_count = sbi->user_block_count - sbi->current_reserved_blocks;
+		if (t <= sbi->hot_data_age_threshold || t >= avail_user_block_count)
 			return -EINVAL;
 		if (t == *ui)
 			return count;
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
