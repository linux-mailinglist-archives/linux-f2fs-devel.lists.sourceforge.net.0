Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A547F926DB0
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  4 Jul 2024 04:58:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sPCft-00060K-IY;
	Thu, 04 Jul 2024 02:58:22 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1sPCfr-00060C-Tf
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 04 Jul 2024 02:58:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vA1OqcS6dkNUpPT8Ko82tPSwP6wkV4A1DMg7nyjuFcY=; b=cXp/MNTR8/zoyRZsvv2qXoTCWS
 Wm0SvEN++S+O6L7tVLK0HGnwo0hJ2nHjWs5lkK52nLnAIKo9z3mZ512B+9wu1vlmo7z1ZPWBHpj2R
 3d91+1MCwmFKk4y6y5+5w+nA99uA2aAZ2tav/O8wYBe47E3T/uyMtXYYMlK9cUJxVPmU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=vA1OqcS6dkNUpPT8Ko82tPSwP6wkV4A1DMg7nyjuFcY=; b=N
 oBKvO6L9zoWD1WA+yz0/h5f1ZmcZS2P4fW/eP4qYa6HwyGEsNp/rxneJ/vzUYzwLnyyU2mEO9vNmQ
 G4gcJNYeorsG9sUT3iQyS8KEEOvPaEyizhI4thF8A0gJYHmOkeqn/TE62DLPm9e5pVIZt+NJynNQA
 I/QJUGgTNzOf2/zU=;
Received: from mail-sgaapc01on2042.outbound.protection.outlook.com
 ([40.107.215.42] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sPCfs-00010i-48 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 04 Jul 2024 02:58:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=banEgyUIEbSc18HB4pkSGzOc3mc19s6cZbCMeL8oVhHKabT2GZuJpgV98dN4My8DDZ92lbXaJ58GpxMVvDyfqMi1ljG8dZqe5FWRPagDLKclr/xHFpzkaguWGoVS5A4Hs9tpayI/jsDpGiWG6bL59EWuGDMrGkW+QNUBR2JZFxt6A8uh6zs357He6ItmhwaxYN1hO/ONy/82kMpqMszWcM8L+Uut78qtehdEAVrMw8D5RFSPD2ECEV3QA+gzqBdKSo0rYIZF5e/sg+cxqP0JCDvK9fZ1T/tF008WclnZICLOk28yoxCUKr0vyj0ucFbXkn27BeRqvddMJ5ncnTiXcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vA1OqcS6dkNUpPT8Ko82tPSwP6wkV4A1DMg7nyjuFcY=;
 b=WRDRFGI+4Vke65bHrymrm1rnV0pWCwvqBYNAcVyuyKWjfv0JiZQvtfi86qL6lBKspU+Ykehy/Xx6apqv6+ZJF58RFj20iiuOVfBOT06BQ2qw8MELBrVbXUkIw5IJ+utLCcELPHNE+rHOQER9eO1Ksvtr+jK0IIybvkrqsw6lhW8S1KBWJ5ZpGUe8oyKuqN0nRfVHH32842YXsfwvLi034WK+e+o4kwFNz3IeKzap0mDLrZxb3Lrwb2orkH4KAQ8elsCZxePDavOmf/uM0PC6N+KqEllPZqyw4G9RM3ew6fbJehNvXhMF7+wFD5vmkhtby0b/Vt5t1Jj+7cmF5rBwoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vA1OqcS6dkNUpPT8Ko82tPSwP6wkV4A1DMg7nyjuFcY=;
 b=mwObbRF0qy85C6Aprw77UBwBS+JkojL7vLKH49jo+fvM4+GDvX5Y1XAi+al/RXo+bKJ3NKTbfB8twcTCJ9OeW/xiEsL9vveNK+HnlF9E3Yd66hmuKdwuMLY8w9C+NdO9/3hGj6rcMble98KLemmezkJQk4UPal7a2Gexsu9koDY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com (2603:1096:101:6b::10)
 by SEYPR02MB7733.apcprd02.prod.outlook.com (2603:1096:101:20c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.25; Thu, 4 Jul
 2024 02:58:05 +0000
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796]) by SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796%7]) with mapi id 15.20.7719.029; Thu, 4 Jul 2024
 02:58:05 +0000
To: chao@kernel.org,
	jaegeuk@kernel.org
Date: Thu,  4 Jul 2024 10:57:30 +0800
Message-Id: <20240704025740.527171-1-shengyong@oppo.com>
X-Mailer: git-send-email 2.40.1
X-ClientProxiedBy: TYAPR01CA0220.jpnprd01.prod.outlook.com
 (2603:1096:404:11e::16) To SEYPR02MB6014.apcprd02.prod.outlook.com
 (2603:1096:101:6b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR02MB6014:EE_|SEYPR02MB7733:EE_
X-MS-Office365-Filtering-Correlation-Id: 341c6e33-ab2c-41f3-746c-08dc9bd5204a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|366016|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0i8WHBr10CWQthJ3jQi5kACKNMh8VCdhwENaitj2zfwct+SyuzjjmcV52T69?=
 =?us-ascii?Q?S52iaI/WdVD0way8y9CXx68SDUeb+iKs9Awa50O5ak4NO4txSywnitQ5u0Vy?=
 =?us-ascii?Q?/xHCdhxaqc+UC2U7tUScoe6H6ZxH6nXCKbBXx5mGxpfSnodTIeUCty0vg1vl?=
 =?us-ascii?Q?emtIguEtmFkZ/andHiMOCCoO6Zm3s65Wt9VND8i4EcF7tOK570tgkVl9sTcp?=
 =?us-ascii?Q?Ms9hZsHzaPWCdz0Y9umgR/Mj8pm8LfMb3V6r2bSv9IWcjC9Ve/Z2HCAwIlsc?=
 =?us-ascii?Q?W6suepMeCQBwraUzaJAlVF7s8MEXpLBIyB8vjcJ5T3sxxej6LzdLQkVkg8hR?=
 =?us-ascii?Q?BY4ke95DcefV8Ws+F4zLVJLohTKAr/foCwFVlQu0k28TzdH2A7pP4NM04oNJ?=
 =?us-ascii?Q?QxtggDrJIhHAjEFRBgzGnDdISbveXKUj5z/g0qQsekRx6idH4Rwv8OEq8T5P?=
 =?us-ascii?Q?my2PPxYtQWT52qvbtMJSvGafvFCogLoIICJqHTX3wfvtUWvF7GDc59dfySW8?=
 =?us-ascii?Q?bsYnXaQlkzlmRO2npD+hCwUvizt9cn2BcYbbAD50ap6h1a/xFNFCnR5T9NV6?=
 =?us-ascii?Q?GLjvXgqsuDyc927EP3zAVQFOI1zdJxh9gO939HGyniZEP6miBnQoQlN9I9ZR?=
 =?us-ascii?Q?oUncBZc1n5FfADKtSFk1LufKTPa+L6QBUjmXvH5OfP4oJh4bMEBJDNIufTbr?=
 =?us-ascii?Q?Ts81S/nTf5zoTAfyExQG6NBjSyXanY4c0gPE5An2V+5IpNDl5rLARssz+UuP?=
 =?us-ascii?Q?rBF10BMpfMN91iCK+WpH0os84x5c/dm/7pdgNqwdVV9C6o24q9asuPC3wL2W?=
 =?us-ascii?Q?CovaizT6rQub/rnKw1PXYUoCueSk3Hv4dnxw5ndmCST2QFBnUc1cg7LFgGNz?=
 =?us-ascii?Q?cB/Q+H3sRqgMuZQU0IlXmr4JavkYH6Ek33ToTt4GZVuWdfLxknl+98gs7OfA?=
 =?us-ascii?Q?Z0yQbpE9CKAKFQh4FhBIk5Ag0ukW2fEoFUYXVhB0FhPYqzUJ0XmgfTWqg0t8?=
 =?us-ascii?Q?ZdLoEO7LQt1TI6pCQL/K8MNeGTZIQL+h4gcRuX4Ig5BGeGpkO/7aN/qSYnEx?=
 =?us-ascii?Q?VYsEI+h5wCtbVOtKdikgqArM0KEhh8SA/ucHj5UA8meRhOitgWwHr6WohGdQ?=
 =?us-ascii?Q?FkcVRIeeZNGsoShIiSMUoh6ZvEFsHH4aV3sXIT7xnb6mmgbx4Y7LxcXfa72/?=
 =?us-ascii?Q?TqRb9FCF6EuEp0/bkkeIB3Pun8jei9Zq2UX1g6XQsHjROaigdmN0KCxviG0R?=
 =?us-ascii?Q?50PS/1QCjdVLYbxAoOVYu8U+1mSM2NqO6Jwa1PkRJ4cAMD34KH6HwRwm+h0I?=
 =?us-ascii?Q?DLtypNmzU0SQfOxjhE38AD3SxSV2/BnVKe35gfL9ARZIhWQVICqSLG9SrzKM?=
 =?us-ascii?Q?XnR4v2XoSWhkK/D/y4SEQhdU9BMUw/xkU8iUSA3eOlytwgSGWA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR02MB6014.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ncvJt8dazOfL5w7F1n5Y3Fs0Ddw5SCLvtAIJ9KaiZdvHD25svNhwsRUv9GTq?=
 =?us-ascii?Q?RG/pv/7Bynh4ebbjzOcDNspIo6ZrEirFOtwKpeIiQb1MEINHTHlGgE0NKNu9?=
 =?us-ascii?Q?a8MnutR5fPJgeXcWjDmyDUwyULqeyCdX04NI9xzV8MtIqZkkVDw37zSwiNnO?=
 =?us-ascii?Q?RZRf3Hj7Nj7r+q9aSK0ZHanDHwMh+b7MvVwuzkyFXJYNZLEp97hxAJPwoX84?=
 =?us-ascii?Q?LIHk9YGvf90G2kVHvkt2DwmZon+ipI+D5LxiW4SS9rT0Dzm6/NiZvEnmEWHF?=
 =?us-ascii?Q?mJ9LuqGyjd7czwI5tNR4TyfI++/lsEpKSr4/oQnD9xGpvpzCGusOsF6Qhlk6?=
 =?us-ascii?Q?zHbQmqv27zBB5I2Ic9vKHdE5wWdcAZTQsBj0f0xPXFxu4/6fT3/rfQ4osN0o?=
 =?us-ascii?Q?aW2Tir7I2Xeq6rEdpBgQvQLP65yiVA2cQ1+Xe0MAtX3wFGbDjcL9xfUChLOH?=
 =?us-ascii?Q?XWh0wabBH56oSUFGaGeWE1a8Xyiz1mz7MREzOAZwrPqNpT61dVEgqMD5IFei?=
 =?us-ascii?Q?2kUCcJOv3sLjTLAWlwFUPrcUuMMIOzs6BcJ7xIbKFrnvinu/yEeKjER9r7MJ?=
 =?us-ascii?Q?HRtV4zL9fWa8i71EXkh6AbVnKQlsqyl63O/XugZK4JdWbE0CP9nKnLdMlybJ?=
 =?us-ascii?Q?HvhG6n2AspV4d0XcMAnpg8G9iRNsOkwvrHLuA7ZeyL2IewSD/J/xD7BsvJre?=
 =?us-ascii?Q?NARVYUqiAy8mcfeAw5eTCldLs29VyIKE4xVkXMCDQcpYXgOI+OkDpoBdEUs6?=
 =?us-ascii?Q?9HEvEUA9UqTaAFjBNM8adwbG2sulYDIyphdnzbMnF+8MQHaz7PU9QbFq+PzS?=
 =?us-ascii?Q?is04BpII5v5L6w6Ba33eesRWNzQYen9bdkQq4E/ITR2L2zl0F2+g7RYhdG5J?=
 =?us-ascii?Q?hEajUagMJMRfah6GXQJwZjKCuSHZn/3wq4rmOT3zo2oo/8exFb730QWdk9k0?=
 =?us-ascii?Q?gsWzwzCXYU1S8XVvkTXgawX5AmokgaftgYWBV6QAIUJNBIWKbfafiINhZ34g?=
 =?us-ascii?Q?R+JsJfzkrjrM2lTTsQmg6FByjvUSxMKhDxUlMfgWHit8j3me15l4tpnS0kgv?=
 =?us-ascii?Q?Z03JVEuuXkofactyMqMtEaJd/M75fVf7qP2g10ER+ukMEL/3+UkPaiWlKrv9?=
 =?us-ascii?Q?DusrKiiA/fE9vstlj4hCGfQ76yXmVuGmLKOhYO2uX3YO3sAr2+zIfcIJPe/c?=
 =?us-ascii?Q?30Nrk2mKGAaSHSriUTVbQUyvibNe10WPrieuiF0SIrXtmVo2shmLJ0HFmR+1?=
 =?us-ascii?Q?dCHCPFRvXl8s6XXp3UscRR/Rp3BTKPnqUoTm1tBlERdk/uydVSCCjfwRUVlw?=
 =?us-ascii?Q?3hPt5JrkOZ0bL1aUkS4rC1V7tl/kGnSeAv/VrYMIin9qBZmaNCrkLx6LEoUJ?=
 =?us-ascii?Q?oonUaU8JI2ytxfsjNLTDY9rLWJPBYXQF3IqR/W31Ubp1GA3dYO0tg5vXynrQ?=
 =?us-ascii?Q?SEdSDhYnyiyem/5y4MPGeTSaq0fyQNJV3xJEh5z1ZykU4pFp+mDAmbVNWDFu?=
 =?us-ascii?Q?wqyFSKQWNNetGehEeRA8UQ7tliomPIZElvu/5cOUwfb1yZdkSaYwXGTYwNn0?=
 =?us-ascii?Q?XO2W/as4DkZTIflZHOnjDyp9FwG5Rrhs8M21G3Ne?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 341c6e33-ab2c-41f3-746c-08dc9bd5204a
X-MS-Exchange-CrossTenant-AuthSource: SEYPR02MB6014.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2024 02:58:05.3827 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8JcV5Q4vulPoIC+qVMyomuhcu/q4uZiAXQ0rZg5YWl6C+xOw9XjvQlkrpE/1Em8ZSgsYLElNi7BgbhNtWuT8pQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR02MB7733
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This patchset introduces a new tool inject.f2fs to modify
 metadata or data (directory entry) of f2fs image offline flexibly. With
 inject.f2fs, 
 it is easier to generate a corrupted f2fs image, which can help verify fsck
 or reproduce userspace behaviors of some a fault. If option `--dry-run' is
 used, nothing really gets chang [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: makefile.am]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.215.42 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.215.42 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [40.107.215.42 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.42 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1sPCfs-00010i-48
Subject: [f2fs-dev] [RCF PATCH v3 00/10] f2fs-tools: introduce inject.f2fs
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
From: Sheng Yong via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Sheng Yong <shengyong@oppo.com>
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patchset introduces a new tool inject.f2fs to modify metadata or
data (directory entry) of f2fs image offline flexibly.

With inject.f2fs, it is easier to generate a corrupted f2fs image, which
can help verify fsck or reproduce userspace behaviors of some a fault.
If option `--dry-run' is used, nothing really gets changed, and that
could be used to get the value of a specified field.

inject.f2fs allows injecting some members in sb, cp, nat, sit, ssa, node
and dentry for now. The available members of each part can be listed by
executing command like:
  inject.f2fs --sb 0 --help

  [...]
  [mb]:
    magic: inject magic number
    s_stop_reason: inject s_stop_reason array selected by --idx <index>
    s_errors: inject s_errors array selected by --idx <index>
    devs.path: inject path in devs array selected by --idx <index> specified by --str <string>

More injection fields are still work-in-progress. The TODO list includes:
 * sb: features
 * cp: fsync dnodes
 * inode: extent, extra attrs, xattr
 * data: fsverify?
 * other fields which is needed to verify fsck

v3:
  * patch 3, fix error handling of inject sb->devs.path
  * patch 3, do not ASSERT devs.path when inject is executed
  * patch 3, allow inject to execute if image is umounted unclean
  * patch 9, check whether blkaddr is valid before reading dentry block
  * add is_digits and strtol entptr check when parsing numeric options

v2:
  * change print format of s_errors
  * add write_raw_cp_blocks to write the first & last cp blocks directly
    to avoid updating ckpt_flags by write_checkpoint
  * call update_block if i_inode_checksum is injected to avoid updating
    i_inode_checksum by update_inode
  * go through all dentry blocks to find the target dir entry

Examples:

Inject sb's magic
=================
inject.f2fs --sb 0 --mb magic --val 0x12345 $DEV

Info: inject sb auto
Info: inject member magic
Info: inject value 74565 : 0x12345
[...]
Info: inject magic of sb 1: 0xf2f52010 -> 0x12345
[update_superblock: 890] Info: Done to update superblock

Inject cp's cur_data_segno
==========================
inject.f2fs --cp 0 --mb cur_data_segno --idx 1 --val 0x12345 $DEV

Info: inject cp pack auto
Info: inject member cur_data_segno
Info: inject slot index 1
Info: inject value 74565 : 0x12345
[...]
Info: inject cur_data_segno[1] of cp 1: 0x4 -> 0x12345
Info: write_checkpoint() cur_cp:1

Inject nat's ino
================
inject.f2fs --nat 0 --mb ino --nid $INO --val 0x12345 $DEV

Info: inject nat pack auto
Info: inject nid 4 : 0x4
Info: inject member ino
Info: inject value 74565 : 0x12345
[...]
Info: inject nat entry ino of nid 4 in pack 1: 4 -> 74565

Inject ssa's nid
================
inject.f2fs --ssa --blk $BLK --mb nid --val 0x12345 $DEV

Info: inject ssa
Info: inject blkaddr 7511 : 0x1d57
Info: inject member nid
Info: inject value 74565 : 0x12345
[...]
Info: auto idx = 343
Info: inject summary entry nid of block 0x1d57: 0x4 -> 0x12345

Inject inode's i_addr
=====================
inject.f2fs --node --nid $INO --mb i_addr --idx 100 --val 0x12345 $DEV

Info: inject node
Info: inject nid 4 : 0x4
Info: inject member i_addr
Info: inject slot index 100
Info: inject value 74565 : 0x12345
[...]
Info: inject inode i_addr[100] of nid 4: 0x20864 -> 0x12345

Inject inode's dentry hash
==========================
inject.f2fs --dent --nid $INO --mb d_hash --val 0x12345 $DEV

Info: inject dentry
Info: inject nid 4 : 0x4
Info: inject member d_hash
Info: inject value 74565 : 0x12345
[..]
Info: inject dentry d_hash of nid 4: 0xc77b804e -> 0x12345

Sheng Yong (10):
  f2fs-tools: export is_digits
  inject.f2fs: introduce inject.f2fs
  inject.f2fs: add sb injection
  inject.f2fs: add cp injection
  inject.f2fs: add nat injection
  inject.f2fs: add sit injection
  inject.f2fs: add ssa injection
  inject.f2fs: add node injection
  inject.f2fs: add dentry injection
  man: add inject.f2fs man page

 fsck/Makefile.am  |    5 +-
 fsck/fsck.h       |    6 +
 fsck/inject.c     | 1104 +++++++++++++++++++++++++++++++++++++++++++++
 fsck/inject.h     |   41 ++
 fsck/main.c       |   38 +-
 fsck/mount.c      |   30 +-
 include/f2fs_fs.h |    2 +
 man/Makefile.am   |    2 +-
 man/inject.f2fs.8 |  225 +++++++++
 9 files changed, 1447 insertions(+), 6 deletions(-)
 create mode 100644 fsck/inject.c
 create mode 100644 fsck/inject.h
 create mode 100644 man/inject.f2fs.8

-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
